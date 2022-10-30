import 'package:flutter/material.dart';
import 'package:music_streaming_app/views/utils/styles/custom_colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton(
      {super.key, this.width = 35, this.onPressed, required this.icon});

  final double width;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final double borderRadius = width / 2;
    return CircleAvatar(
      radius: borderRadius,
      backgroundColor: CustomColors.green49,
      child: IconButton(
        icon: Icon(
          icon,
          size: borderRadius,
          color: CustomColors.black20,
        ),
        iconSize: 50,
        onPressed: onPressed,
      ),
    );
  }
}
