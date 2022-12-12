import 'package:flutter/material.dart';

import './screens/splash/splash_screen.dart';
import './screens/sign_in/sign_in_screen.dart';
import './screens/login_success/login_success_screen.dart';
import './screens/forgot_password/forgot_password_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
};
