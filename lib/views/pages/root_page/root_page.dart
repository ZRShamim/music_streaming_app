import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_streaming_app/controllers/audio_player_controller.dart';
import 'package:music_streaming_app/views/pages/root_page/widgets/audio_list.dart';
import 'package:music_streaming_app/views/pages/root_page/widgets/audio_player.dart';

class Rootpage extends StatelessWidget {
  Rootpage({super.key});

  final AudioPlayerController controller = Get.put(AudioPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Book'),
      ),
      body: Column(
        children: [
          AudioList(),
          AudioPlayer(),
        ],
      ),
    );
  }
}
