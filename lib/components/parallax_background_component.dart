import 'package:flutter/material.dart';

class ParallaxBackgroundComponent extends StatelessWidget {
  const ParallaxBackgroundComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height - kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: const AssetImage(
              "assets/images/parallax-background.png",
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.dstATop,
            ),
          ),
        ),
      ),
    );
  }
}
