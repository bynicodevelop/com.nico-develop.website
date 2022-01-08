import 'package:flutter/material.dart';

const double primaryFontSize = 18.0;

const double defaultPadding = 25.0;

const Color primaryColor = Color(0xFFCB4335);

class CustomThemeData {
  static final ThemeData defaultTheme = _buildCustomThemeData();

  static ThemeData _buildCustomThemeData() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        headline1: base.textTheme.headline1!.copyWith(
          fontSize: 80.0,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        headline2: base.textTheme.headline2!.copyWith(
          fontSize: 30.0,
          color: Colors.black,
        ),
        headline3: base.textTheme.headline2!.copyWith(
          fontSize: 18.0,
          color: Colors.black,
        ),
        bodyText1: base.textTheme.bodyText1!.copyWith(
          fontSize: 18.0,
          color: Colors.black,
          height: 1.5,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          onPrimary: Colors.white,
          textStyle: base.textTheme.bodyText1!.copyWith(
            fontSize: primaryFontSize,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w400,
          ),
          padding: const EdgeInsets.all(
            defaultPadding,
          ),
        ),
      ),
    );
  }
}
