import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_streaming_app/controllers/audio_player_controller.dart';
import 'package:music_streaming_app/views/pages/global_widgets/play_button.dart';
import 'package:music_streaming_app/views/utils/styles/custom_colors.dart';
import 'package:music_streaming_app/views/utils/styles/custom_styles.dart';

class AudioPlayerPage extends StatelessWidget {
  AudioPlayerPage({super.key});

  final AudioPlayerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Book'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz_rounded,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Title',
                  style: CustomStyles.titleStyle,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Subtitle',
                  style: CustomStyles.subtitleStyle,
                ),
                const SizedBox(height: 15),
                Divider(
                  height: 2,
                  color: CustomColors.white.withOpacity(0.5),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => ProgressBar(
                    progress: controller.position.value,
                    total: controller.duration.value,
                    buffered: controller.bufferPosition.value,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // skip_previous_outlined
                    AudioActionButton(
                      onPressed: () {},
                      icon: Icons.skip_previous_outlined,
                    ),
                    // replay_10_outlined
                    AudioActionButton(
                      onPressed: () {},
                      icon: Icons.replay_10_outlined,
                    ),
                    // play
                    const PlayButton(
                      icon: Icons.play_arrow_outlined,
                      width: 70,
                    ),
                    // forward_10_outlined
                    AudioActionButton(
                      onPressed: () {},
                      icon: Icons.forward_10_outlined,
                    ),

                    // skip_next_outlined
                    AudioActionButton(
                      onPressed: () {},
                      icon: Icons.skip_next_outlined,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AudioActionButton extends StatelessWidget {
  const AudioActionButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: CustomColors.white,
        size: 32,
      ),
    );
  }
}
