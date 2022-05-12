import 'package:flutter/material.dart';
import 'package:learningdart/constants/routes.dart';
import 'package:learningdart/services/auth/auth_exceptions.dart';
import 'package:learningdart/services/auth/auth_services.dart';
import 'package:learningdart/utilities/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
        ),
        body: Column(
          children: [
            TextField(
              controller: _email,
              obscureText: false,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  const InputDecoration(hintText: "Enter your email here"),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: "Enter your password here",
              ),
            ),
            TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  await AuthService.firebase().createUser(email: email, password: password);
                  await AuthService.firebase().sendEmailVerification();
                  Navigator.of(context).pushNamedAndRemoveUntil(verifyEmailRoute, (route) => false);
                } on WeakPasswordAuthException {
                  await showErrorDialog(context, "Weak Password");
                } on EmailAlreadyInUseAuthException {
                  await showErrorDialog(context, "Email Already In Use");
                } on InvalidEmailAuthException {
                  await showErrorDialog(context, "Invalid Email");
                } on GenericAuthException {
                  await showErrorDialog(context, "Failed to Register");
                }
              },
              child: const Text("Register"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                },
                child: const Text("Already Registered? Login here!"))
          ],
        ));
  }
}
