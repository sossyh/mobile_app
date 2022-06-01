import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tutorapp/registration/registration.dart';

class Registration_form extends StatelessWidget {
  Registration_form({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confpassController = TextEditingController();
  final usernameController = TextEditingController();
  final fullnameController = TextEditingController();

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
              Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.lightBlue,
                        size: 25.0,
                      ),
                      onPressed: () {
                        //Navigator.of(context).pushNamed(LoginPage.tag);
                      },
                    ),
                  ),
                  SizedBox(width: 0.0),
                  Text(
                    'Register',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                controller: fullnameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Full Name",
                  border: OutlineInputBorder(),
                ),
                validator: (String? fullname) {
                  if (fullname == null || fullname.isEmpty) {
                    return "please enter your Full Name";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_add_alt_1_rounded),
                  hintText: "User name",
                  border: OutlineInputBorder(),
                ),
                validator: (String? username) {
                  if (username == null || username.isEmpty) {
                    return "please enter a UserName";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  hintText: "Email",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                ),
                validator: (String? password) {
                  if (password == null || password.isEmpty) {
                    return "Please enter password";
                  }

                  final validPassword =
                      password.length >= 8 || password.length <= 16;
                  return validPassword
                      ? null
                      : "Password must be between 8 and 16 characters";
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  obscureText: true,
                  controller: confpassController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.spellcheck),
                    hintText: "confirm Password",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  ),
                  validator: (String? confirm_password) {
                    if (confirm_password != passController.text) {
                      return "Please enter the same password as before";
                    }
                  }),
              SizedBox(height: 10),
              BlocConsumer<RegistrationBloc, RegistrationState>(
                listenWhen: (previous, current) {
                  return current is RegistrationSuccessful;
                },
                listener: (_, RegistrationState state) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Registration_form(),
                    ),
                  );
                },
                builder: (_, RegistrationState state) {
                  Widget buttonChild = Text("Sign Up");

                  if (state is Registration) {
                    buttonChild = SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }

                  if (state is RegistrationSuccessful) {
                    buttonChild = Container(
                        child: ElevatedButton(
                      onPressed: () {
                        onTap:
                        () => context.go('/page2');
                      },
                      child: Text("successfully registered"),
                    ));
                  }

                  if (state is RegistrationFailed) {
                    buttonChild = Text("Login Failed");
                  }

                  return ElevatedButton(
                    onPressed: () {
                      final formValid = formKey.currentState!.validate();
                      if (!formValid) return;

                      final regBloc =
                          BlocProvider.of<RegistrationBloc>(context);
                      regBloc.add(Register(
                        fullname: fullnameController.text,
                        username: usernameController.text,
                        email: emailController.text,
                        password: passController.text,
                        confirm_password: passController.text,
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
