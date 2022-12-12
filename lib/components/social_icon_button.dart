import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: const BoxDecoration(
        color: Color(0xFFF5F6F9),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
