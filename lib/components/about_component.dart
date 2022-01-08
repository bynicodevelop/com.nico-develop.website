import 'package:com_nico_develop_app/config/custom_theme_data.dart';
import 'package:com_nico_develop_app/responsive.dart';
import 'package:com_nico_develop_app/widgets/cta_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutComponent extends StatelessWidget {
  const AboutComponent({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  Widget _buildMobile(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: defaultPadding,
            ),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "assets/images/profile.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Text(
                  "A propos de moi",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: defaultPadding,
                ),
                child: Text(
                  "👈 20 ans de code... \nÇa commence à taper un peu sur la caboche. \nPar contre, je ne mords pas encore. \nTu peux donc me suivre sur les différents réseaux justes au-dessus. \nLà, où je suis le plus présent c'est sur ma chaîne. \nJe donne des trucs, des astuces pour t'aider à mieux coder chaque jour.",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        height: 2,
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CtaButtonWidget(
                    label: "S'abonner",
                    onPressed: () => _launchURL(
                      "https://www.youtube.com/c/NicoDevelop?sub_confirmation=1",
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      );

  Widget _buildTablet(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: defaultPadding,
              ),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "assets/images/profile.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                  ),
                  child: Text(
                    "A propos de moi",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: defaultPadding,
                  ),
                  child: Text(
                    "👈 20 ans de code... \nÇa commence à taper un peu sur la caboche. \nPar contre, je ne mords pas encore. \nTu peux donc me suivre sur les différents réseaux justes au-dessus. \nLà, où je suis le plus présent c'est sur ma chaîne. \nJe donne des trucs, des astuces pour t'aider à mieux coder chaque jour.",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          height: 2,
                        ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CtaButtonWidget(
                      label: "S'abonner",
                      onPressed: () => _launchURL(
                        "https://www.youtube.com/c/NicoDevelop?sub_confirmation=1",
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      );

  Widget _buildDefault(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: defaultPadding,
              ),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "assets/images/profile.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                  ),
                  child: Text(
                    "A propos de moi",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: defaultPadding,
                  ),
                  child: Text(
                    "👈 20 ans de code... \nÇa commence à taper un peu sur la caboche. \nPar contre, je ne mords pas encore. \nTu peux donc me suivre sur les différents réseaux justes au-dessus. \nLà, où je suis le plus présent c'est sur ma chaîne. \nJe donne des trucs, des astuces pour t'aider à mieux coder chaque jour.",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          height: 2,
                        ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "S'abonnoner".toUpperCase(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    final double size = Responsive.isDesktop(context)
        ? MediaQuery.of(context).size.width - 900
        : Responsive.isTablet(context)
            ? MediaQuery.of(context).size.width - 400 * 2
            : MediaQuery.of(context).size.width;

    final double padding = size < 0 || Responsive.isMobile(context)
        ? defaultPadding * 3
        : size / 2;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 100.0,
        horizontal: padding,
      ),
      color: Colors.white,
      child: Responsive(
          mobile: _buildMobile(context),
          tablet: _buildTablet(context),
          desktop: _buildDefault(context)),
    );
  }
}
