import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_streaming_app/controllers/audio_player_controller.dart';

class AudioPlayerWidget extends StatelessWidget {
  AudioPlayerWidget({super.key});

  final AudioPlayerController controller = Get.put(AudioPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Book'),
      ),
      body: Column(
        children: [
          Obx(
            () => ProgressBar(
              progress: controller.position.value,
              total: controller.duration.value,
              buffered: controller.bufferPosition.value,
              onSeek: (duration) => controller.onSeek(duration),
            ),
          ),
          // play/pause button
          CircleAvatar(
            radius: 35,
            child: Obx(
              () => IconButton(
                icon: Icon(
                  controller.isPLaying.value ? Icons.pause : Icons.play_arrow,
                ),
                iconSize: 50,
                onPressed: controller.playAudio,
              ),
            ),
          )
        ],
      ),
    );
  }
}
