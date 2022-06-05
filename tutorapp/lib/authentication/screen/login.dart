import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
        padding: const EdgeInsets.all(10.0),
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
                    return "please enter your Email account";
                  }

                  final validEmail = RegExp("[A-Za-z]@[A-Za-z].[A-Za-z]");
                  final correct_email = validEmail.hasMatch(email);

                  return correct_email ? null : "Enter a valid email";
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
                    return "Please enter password";
                  }

                  final validPassword = password.length >= 8;
                  return validPassword
                      ? null
                      : "Password must be between 8 and 16 characters";
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
                  Widget buttonChild = ElevatedButton(
                    onPressed: () {
                      context.go('/category');
                    },
                    child: Text("Log In"),
                  );
                  if (state is LogingIn) {
                    
                    context.push('/category');
                     
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          context.push('/Registration_form');
                        },
                        child: const Text("Register")),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
