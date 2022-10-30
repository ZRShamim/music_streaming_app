import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_streaming_app/controllers/audio_player_controller.dart';
import 'package:music_streaming_app/models/audio.dart';
import 'package:music_streaming_app/views/pages/root_page/widgets/audio_tile.dart';
import 'package:music_streaming_app/views/utils/styles/custom_colors.dart';

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
          Flexible(
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
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFF1C1B1B),
                  blurRadius: 15.sp,
                  offset: const Offset(0, 0),
                  spreadRadius: 30.sp,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Obx(
                          () => ProgressBar(
                            progress: controller.position.value,
                            total: controller.duration.value,
                            buffered: controller.bufferPosition.value,
                            onSeek: (value) => controller.onSeek(value),
                            baseBarColor: CustomColors.white.withOpacity(.35),
                            progressBarColor: CustomColors.primaryGreen,
                            thumbColor: CustomColors.primaryGreen,
                            bufferedBarColor:
                                CustomColors.primaryGreen.withOpacity(0.25),
                            timeLabelTextStyle: const TextStyle(
                              color: CustomColors.white,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.back();
                            },
                            iconSize: 30.sp,
                            icon: const Icon(
                              Icons.skip_previous,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.smartPlay();
                            },
                            iconSize: 45.sp,
                            icon: Obx(
                              () => Icon(
                                controller.isPLaying.value
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.next();
                            },
                            iconSize: 30.sp,
                            icon: const Icon(
                              Icons.skip_next,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
