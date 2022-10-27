import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_streaming_app/controllers/audio_player_controller.dart';
import 'package:music_streaming_app/views/pages/global_widgets/play_button.dart';
import 'package:music_streaming_app/views/utils/styles/custom_styles.dart';

class Rootpage extends StatelessWidget {
  Rootpage({super.key});
  final AudioPlayerController controller = Get.put(AudioPlayerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Book'),
      ),
      body: ListView.separated(
        itemCount: controller.audioList.length,
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemBuilder: (ctx, index) {
          return SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1437773409l/6681454._SY475_.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.audioList[index].title!,
                          style: CustomStyles.titleStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.audioList[index].subtitle!,
                          style: CustomStyles.subtitleStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const PlayButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
