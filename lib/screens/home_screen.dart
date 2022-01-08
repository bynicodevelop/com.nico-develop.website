import 'package:com_nico_develop_app/components/about_component.dart';
import 'package:com_nico_develop_app/components/app_bar_component.dart';
import 'package:com_nico_develop_app/components/footer_component.dart';
import 'package:com_nico_develop_app/components/hero_banner_component.dart';
import 'package:com_nico_develop_app/components/last_articles_component.dart';
import 'package:com_nico_develop_app/components/logos_banner_component.dart';
import 'package:com_nico_develop_app/components/parallax_background_component.dart';
import 'package:com_nico_develop_app/screens/lead_page_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      body: Stack(
        children: [
          const ParallaxBackgroundComponent(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeroBannerComponent(
                  mainTitle:
                      "Devenez développeur Web et mobile Flutter & Firebase",
                  buttonLabel: "Commencer maintenant",
                  buttonAction: () => Navigator.pushNamed(
                    context,
                    LeadPageScreen.routeName,
                  ),
                ),
                const LogosBannerComponent(),
                const LastArticlesComponent(),
                const AboutComponent(),
                const FooterComponent(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
