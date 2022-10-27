import 'package:flutter/material.dart';
import 'package:music_streaming_app/views/utils/styles/custom_colors.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.more_vert_outlined,
        color: CustomColors.white,
      ),
    );
  }
}
