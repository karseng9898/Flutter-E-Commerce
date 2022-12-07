import 'package:flutter/material.dart';

import './components/body.dart';
import '../../size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const Scaffold(
      body: Body(),
    );
  }
}
