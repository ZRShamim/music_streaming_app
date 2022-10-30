import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_streaming_app/controllers/audio_player_controller.dart';
import 'package:music_streaming_app/views/pages/root_page/widgets/audio_tile.dart';

class AudioList extends StatelessWidget {
  AudioList({
    Key? key,
  }) : super(key: key);

  final AudioPlayerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        itemCount: controller.audioList.length,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemBuilder: (ctx, index) {
          return Obx(
            () => AudioTile(
              title: controller.audioList[index].title!,
              subtitle: controller.audioList[index].subtitle!,
              isPlaying: controller.currentStreamIndex.value == index,
              onTap: () {
                controller.currentStreamIndex.value = index;
                controller.play();
              },
            ),
          );
        },
      ),
    );
  }
}
