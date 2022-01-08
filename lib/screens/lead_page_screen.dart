import 'package:com_nico_develop_app/components/app_bar_component.dart';
import 'package:com_nico_develop_app/components/basic_video_component.dart';
import 'package:com_nico_develop_app/components/hero_banner_component.dart';
import 'package:com_nico_develop_app/components/optin_form_component.dart';
import 'package:com_nico_develop_app/components/parallax_background_component.dart';
import 'package:com_nico_develop_app/components/program_collapse_component.dart';
import 'package:flutter/material.dart';

class LeadPageScreen extends StatefulWidget {
  static const String routeName = '/lead-page';

  const LeadPageScreen({Key? key}) : super(key: key);

  @override
  State<LeadPageScreen> createState() => _LeadPageScreenState();
}

class _LeadPageScreenState extends State<LeadPageScreen> {
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
              children: const [
                HeroBannerComponent(
                  mainTitle: "Commencez avec\n5 vidéos GRATUITES",
                  subTitle:
                      "Pour devenir développeur mobile avec Flutter et Firebase.",
                  maxHeight: 50,
                ),
                ProgramCollapseComponent(),
                BasicVideoComponent(
                  title: "Présentation de la formation Flutter Ultimate",
                  videoId: "1jetqyNDz2E",
                ),
                OptinFormComponent(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
