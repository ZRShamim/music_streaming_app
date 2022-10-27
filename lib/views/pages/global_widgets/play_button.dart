import 'package:flutter/material.dart';
import 'package:music_streaming_app/views/utils/styles/custom_colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key, this.borderRadius = 20, this.width = 35});

  final double borderRadius;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: borderRadius,
      child: IconButton(
        icon: const Icon(
          Icons.play_arrow,
          size: 20,
        ),
        iconSize: 50,
        onPressed: () {},
        // controller.playAudio(url),
      ),
    );
  }
}
