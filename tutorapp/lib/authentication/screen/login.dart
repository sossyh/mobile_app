import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tutorapp/authentication/authentication.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (String? email) {
                  if (email == null || email.isEmpty) {
                    return "Email must not be empty";
                  }

                  final validEmail = RegExp("[A-Za-z]@[A-Za-z].[A-Za-z]");
                  final correct = validEmail.hasMatch(email);

                  return correct ? null : "Enter a valid email";
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                controller: passController,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (String? password) {
                  if (password == null || password.isEmpty) {
                    return "Password must not be empty";
                  }

                  final validPassword = password.length >= 8;
                  return validPassword ? null : "Password too short";
                },
              ),
              SizedBox(height: 10),
              BlocConsumer<AuthBloc, AuthState>(
                listenWhen: (previous, current) {
                  return current is LoginSuccessful;
                },
                listener: (_, AuthState state) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  );
                },
                builder: (_, AuthState state) {
                  Widget buttonChild = Text("Log in");

                  if (state is LogingIn) {
                    buttonChild = SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }

                  if (state is LoginSuccessful) {
                    buttonChild = Text("Login successful");
                  }

                  if (state is LoginFailed) {
                    buttonChild = Text("Login Failed");
                  }

                  return ElevatedButton(
                    onPressed: () {
                      final formValid = formKey.currentState!.validate();
                      if (!formValid) return;

                      final authBloc = BlocProvider.of<AuthBloc>(context);
                      authBloc.add(Login(
                        email: emailController.text,
                        password: passController.text,
                      ));
                    },
                    child: buttonChild,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
