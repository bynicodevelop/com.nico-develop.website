import 'package:com_nico_develop_app/config/custom_theme_data.dart';
import 'package:com_nico_develop_app/responsive.dart';
import 'package:com_nico_develop_app/widgets/cta_button_widget.dart';
import 'package:flutter/material.dart';

class HeroBannerComponent extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  final double minHeight;
  final double maxHeight;
  final String? buttonLabel;
  final Function()? buttonAction;

  const HeroBannerComponent({
    Key? key,
    required this.mainTitle,
    this.subTitle = "",
    this.minHeight = 80.0,
    this.maxHeight = 150.0,
    this.buttonLabel,
    this.buttonAction,
  }) : super(key: key);

  Widget _build(
    BuildContext context,
    double width,
  ) {
    final double size = MediaQuery.of(context).size.width - width;

    final double padding = size < 0 || Responsive.isMobile(context)
        ? defaultPadding
        : Responsive.isTablet(context)
            ? size / 4
            : size / 2;

    final double? fontSize = Responsive.isMobile(context)
        ? Theme.of(context).textTheme.headline1!.fontSize! / 1.5
        : Responsive.isTablet(context)
            ? Theme.of(context).textTheme.headline1!.fontSize! / 1.2
            : Theme.of(context).textTheme.headline1!.fontSize;

    final double? secondaryFontSize = Responsive.isMobile(context)
        ? Theme.of(context).textTheme.headline2!.fontSize! / 1.5
        : Responsive.isTablet(context)
            ? Theme.of(context).textTheme.headline2!.fontSize! / 1.2
            : Theme.of(context).textTheme.headline2!.fontSize;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isMobile(context) ? minHeight : maxHeight,
        horizontal: padding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: defaultPadding,
            ),
            child: Text(
              mainTitle,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: fontSize,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: const Offset(
                      1.0,
                      1.0,
                    ),
                    blurRadius: 5.0,
                    color: Colors.black.withOpacity(.4),
                  ),
                ],
              ),
            ),
          ),
          if (subTitle.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                bottom: defaultPadding,
              ),
              child: Text(
                subTitle,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: secondaryFontSize,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: const Offset(
                        1.0,
                        1.0,
                      ),
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(.4),
                    ),
                  ],
                ),
              ),
            ),
          if (buttonLabel != null && buttonAction != null)
            CtaButtonWidget(
              label: buttonLabel!,
              onPressed: buttonAction!,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _build(
        context,
        0,
      ),
      tablet: _build(
        context,
        400.0,
      ),
      desktop: _build(
        context,
        900.0,
      ),
    );
  }
}
