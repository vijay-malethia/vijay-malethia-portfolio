import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';

class NavigationTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const NavigationTextButton(
      {super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.w400, color: primaryColor),
        ));
  }
}
