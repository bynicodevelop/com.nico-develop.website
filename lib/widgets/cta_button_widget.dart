import 'package:com_nico_develop_app/config/custom_theme_data.dart';
import 'package:com_nico_develop_app/responsive.dart';
import 'package:flutter/material.dart';

class CtaButtonWidget extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const CtaButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label.toUpperCase(),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: Responsive.isMobile(context)
              ? defaultPadding / 1.2
              : defaultPadding,
          horizontal: Responsive.isMobile(context)
              ? defaultPadding / 1.2
              : defaultPadding,
        ),
      ),
    );
  }
}
