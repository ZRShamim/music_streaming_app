import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_streaming_app/controllers/audio_player_controller.dart';

class AudioPlayerWidget extends StatelessWidget {
  AudioPlayerWidget({super.key});

  final AudioPlayerController controller = Get.put(AudioPlayerController());

  @override
  Widget build(BuildContext context) {
    String url = 'http://www.harlancoben.com/audio/CaughtSample.mp3';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Book'),
      ),
      body: Column(
        children: [
          // play/pause button
          CircleAvatar(
            radius: 35,
            child: Obx(
              () => IconButton(
                icon: Icon(
                  controller.isPLaying.value ? Icons.pause : Icons.play_arrow,
                ),
                iconSize: 50,
                onPressed: () => controller.playAudio(url),
              ),
            ),
          ),

          const SizedBox(
            height: 50,
          ),

          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Obx(
              () => Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ProgressBar(
                    progress: controller.position.value,
                    total: controller.duration.value,
                    buffered: controller.bufferPosition.value,
                    onSeek: (duration) => controller.onSeek(duration),
                    baseBarColor: Colors.grey,
                    progressBarColor: Colors.blueGrey,
                    bufferedBarColor: Colors.cyan,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
