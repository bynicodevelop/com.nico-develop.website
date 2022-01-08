import 'package:com_nico_develop_app/config/custom_theme_data.dart';
import 'package:com_nico_develop_app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class BasicVideoComponent extends StatefulWidget {
  final String title;
  final String videoId;

  const BasicVideoComponent({
    Key? key,
    required this.title,
    required this.videoId,
  }) : super(key: key);

  @override
  _BasicVideoComponentState createState() => _BasicVideoComponentState();
}

class _BasicVideoComponentState extends State<BasicVideoComponent> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
    );
  }

  Widget _buildVideoPlayer(
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
      padding: EdgeInsets.symmetric(
        vertical: 100.0,
        horizontal: padding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: defaultPadding,
            ),
            child: Text(
              widget.title.toUpperCase(),
              style: Theme.of(context).textTheme.headline2!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
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
              textAlign: TextAlign.center,
            ),
          ),
          YoutubePlayerIFrame(
            controller: _controller,
            aspectRatio: 16 / 9,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildVideoPlayer(
        context,
        0,
      ),
      tablet: _buildVideoPlayer(
        context,
        400,
      ),
      desktop: _buildVideoPlayer(
        context,
        900,
      ),
    );
  }
}
