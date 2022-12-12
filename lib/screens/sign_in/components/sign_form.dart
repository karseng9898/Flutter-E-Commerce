import 'package:flutter/material.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../login_success/login_success_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool rememberMe = false;

  final Set<String> errors = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: rememberMe,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      rememberMe = value;
                    });
                  }
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                Navigator.of(context).pushNamed(LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

// * Builder functions
  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue ?? "",
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      validator: emailValidator,
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg'),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue ?? "",
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errors.remove(kPassNullError);
          });
        }

        if (value.length >= 8) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: passwordValidator,
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }

// * Helper functions
  String? emailValidator(value) {
    if (value == null) return null;

    if (value.isEmpty) {
      setState(() {
        errors.add(kEmailNullError);
      });
      return "";
    } else if (!emailValidatorRegExp.hasMatch(value)) {
      setState(() {
        errors.add(kInvalidEmailError);
      });
      return "";
    }

    return null;
  }

  String? passwordValidator(value) {
    if (value == null) return null;

    if (value.isEmpty) {
      setState(() {
        errors.add(kPassNullError);
      });
      return "";
    } else if (value.length < 8) {
      setState(() {
        errors.add(kShortPassError);
      });
      return "";
    }
    return null;
  }
}
