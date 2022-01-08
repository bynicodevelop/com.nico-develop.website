import 'package:com_nico_develop_app/config/custom_theme_data.dart';
import 'package:com_nico_develop_app/responsive.dart';
import 'package:flutter/material.dart';

class LastArticlesComponent extends StatelessWidget {
  const LastArticlesComponent({Key? key}) : super(key: key);

  Widget _buildColumnList(
    BuildContext context,
    List<Map<String, dynamic>> thumbs,
  ) =>
      Column(
        children: thumbs
            .map(
              (thumb) => Container(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: <Widget>[
                          Image.asset(
                            thumb["image"],
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        constraints: const BoxConstraints(
                          minHeight: 70.0,
                          maxHeight: 70.0,
                        ),
                        child: Text(
                          thumb["title"],
                          style: Theme.of(context).textTheme.headline3,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      );

  Widget _buildRowList(
    BuildContext context,
    List<Map<String, dynamic>> thumbs,
    double size,
  ) {
    final double widthCard = size / 3 - 10.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: thumbs
          .map(
            (thumb) => SizedBox(
              width: widthCard,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: <Widget>[
                        Image.asset(
                          thumb["image"],
                          width: widthCard,
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      constraints: const BoxConstraints(
                        minHeight: 70.0,
                        maxHeight: 70.0,
                      ),
                      child: Text(
                        thumb["title"],
                        style: Theme.of(context).textTheme.headline3,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _build(
    BuildContext context,
    List<Map<String, dynamic>> thumbs,
    double width,
  ) {
    final double size = MediaQuery.of(context).size.width - width;

    final double padding = size < 0 || Responsive.isMobile(context)
        ? defaultPadding * 3
        : size / 2;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 50.0,
        horizontal: padding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: defaultPadding * 3,
            ),
            child: Text(
              "Derniers articles",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Responsive.isMobile(context)
              ? _buildColumnList(context, thumbs)
              : _buildRowList(
                  context,
                  thumbs,
                  width,
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> thumbs = [
      {
        "image": "assets/images/thumbnail-dart.png",
        "title": "Dart: le langage de Google",
      },
      {
        "image": "assets/images/thumbnail-flutter.png",
        "title": "Flutter: le framework mobile de Google",
      },
      {
        "image": "assets/images/thumbnail-firebase.png",
        "title":
            "Firebase: la plateforme de Google avec en bonus la connexion complète",
      },
    ];

    return Responsive(
      mobile: _build(
        context,
        thumbs,
        0,
      ),
      tablet: _build(
        context,
        thumbs,
        650.0,
      ),
      desktop: _build(
        context,
        thumbs,
        900.0,
      ),
    );
  }
}
