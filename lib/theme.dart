import 'package:flutter/material.dart';

import 'constants.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Muli",
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
