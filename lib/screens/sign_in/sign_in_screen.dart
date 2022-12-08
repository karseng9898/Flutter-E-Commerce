import 'package:flutter/material.dart';

import './components/body.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = "/sign_in";
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign In"),
        ),
        body: const Body());
  }
}
