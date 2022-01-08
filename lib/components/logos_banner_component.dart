import 'package:com_nico_develop_app/config/custom_theme_data.dart';
import 'package:com_nico_develop_app/responsive.dart';
import 'package:flutter/material.dart';

class LogosBannerComponent extends StatelessWidget {
  const LogosBannerComponent({Key? key}) : super(key: key);

  Widget _build(BuildContext context, List<String> icons, double width) {
    final double size = MediaQuery.of(context).size.width - width;

    final double padding = size < 0 || Responsive.isMobile(context)
        ? defaultPadding
        : Responsive.isTablet(context)
            ? size / 4
            : size / 2;

    final double logoSize = Responsive.isMobile(context) ? .6 : 1;

    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: padding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: icons
            .map((icon) => Image.asset(
                  icon,
                  width: 50 * logoSize,
                  height: 50 * logoSize,
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const List<String> icons = [
      "assets/images/dartlang-icon.png",
      "assets/images/flutter-icon.png",
      "assets/images/firebase-icon.png",
      "assets/images/vscode-icon.png",
      "assets/images/github-icon.png",
    ];

    return Responsive(
      mobile: _build(
        context,
        icons,
        0,
      ),
      tablet: _build(
        context,
        icons,
        400.0,
      ),
      desktop: _build(
        context,
        icons,
        900.0,
      ),
    );
  }
}
