import 'package:com_nico_develop_app/config/custom_theme_data.dart';
import 'package:com_nico_develop_app/responsive.dart';
import 'package:com_nico_develop_app/widgets/collapse_widget.dart';
import 'package:flutter/material.dart';

class ProgramCollapseComponent extends StatelessWidget {
  const ProgramCollapseComponent({Key? key}) : super(key: key);

  Widget _buildCollapsedWidget() => CollapseWidget(
        data: [
          {
            "title": "Installer Flutter",
            "content":
                "Dans ce module vous allez découvrir comment installer Flutter sur votre ordinateur. Mais vous allez aussi découvrir les extensions à installer pour développer vos applications multiplateformes.",
            "expanded": false,
          },
          {
            "title": "Coder en Dart",
            "content":
                "Pour coder des applications avec Flutter, il faut apprendre à coder avec le langage Dart. C'est la raison pour laquelle dans ce module, vous allez apprendre à coder avec ce langage de programmation.",
            "expanded": false,
          },
          {
            "title": "Coder avec Flutter",
            "content":
                "Dans ce module, vous allez apprendre à coder ta première application avec Flutter. \n\nÀ la fin de ce module, vous pourrez coder tes premières applications avec Flutter.",
            "expanded": false,
          },
          {
            "title": "Intégrer Firebase",
            "content":
                "À la de ce module, vous pourrez utiliser la base de données proposée par Firebase. \n\nAinsi en intégrant Firestore dans vos applications vous pourrez créer des applications dynamiques.",
            "expanded": false,
          },
          {
            "title": "Déploiement",
            "content":
                "C'est le but ultime de la création d'application. \n\nQue tu veuilles publier sur Google Play ou Apple store, vous allez connaître les prérequis du déploiement d'application pour envoyer vos applications sur les stores.",
            "expanded": false,
          }
        ],
      );

  Widget _buildContent(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: defaultPadding,
            ),
            child: Text(
              "Codez une application Flutter",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: defaultPadding,
            ),
            child: Text(
              "Dans cette formation, vous allez apprendre à coder votre première application de l'installation des outils sur votre ordinateur aux déploiements sur Google Play et Apple Store.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Text(
            "Dans cette formation gratuite, vous allez être capable de prendre en main les différents outils pour devenir développeur Web et mobile avec Flutter.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      );

  Widget _buildColum(
    BuildContext context,
    double width,
  ) {
    final double size = MediaQuery.of(context).size.width - width;

    final double padding = size < 0 || Responsive.isMobile(context)
        ? defaultPadding
        : Responsive.isTablet(context)
            ? size / 4
            : size / 2;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 100.0,
        horizontal: padding,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: defaultPadding,
            ),
            child: _buildContent(context),
          ),
          _buildCollapsedWidget(),
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    double width,
  ) {
    final double size = MediaQuery.of(context).size.width - width;

    final double padding = size < 0 || Responsive.isMobile(context)
        ? 0
        : Responsive.isTablet(context)
            ? size / 4
            : size / 2;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 100.0,
        horizontal: padding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2,
              ),
              child: _buildContent(context),
            ),
          ),
          Expanded(
            child: _buildCollapsedWidget(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildColum(
        context,
        0,
      ),
      tablet: _buildColum(
        context,
        400,
      ),
      desktop: _buildRow(
        context,
        900,
      ),
    );
  }
}
