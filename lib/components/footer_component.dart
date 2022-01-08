import 'package:com_nico_develop_app/config/custom_theme_data.dart';
import 'package:flutter/material.dart';

class FooterComponent extends StatelessWidget {
  const FooterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Copyright 2021 Nico Develop",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: primaryFontSize / 1.2,
                  fontStyle: FontStyle.italic,
                ),
          ),
        ],
      ),
    );
  }
}
