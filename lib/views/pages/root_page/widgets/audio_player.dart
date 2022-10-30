import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_streaming_app/controllers/audio_player_controller.dart';
import 'package:music_streaming_app/views/utils/styles/custom_colors.dart';

class AudioPlayer extends StatelessWidget {
  AudioPlayer({
    Key? key,
  }) : super(key: key);

  final AudioPlayerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: CustomColors.black1B,
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
                      progressBarColor: CustomColors.green68,
                      thumbColor: CustomColors.green68,
                      bufferedBarColor: CustomColors.green68.withOpacity(0.25),
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
                      iconSize: 25.sp,
                      icon: const Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.snackbar(
                          'Not Implemented',
                          '...',
                          backgroundColor: Colors.red,
                        );
                      },
                      iconSize: 25.sp,
                      icon: const Icon(
                        Icons.download,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.smartPlay();
                      },
                      iconSize: 50.sp,
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
                        Get.bottomSheet(Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Set playing speed',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.setSpeed(0.25);
                                },
                                child: const Text('0.25'),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.setSpeed(0.5);
                                },
                                child: const Text('0.5'),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.setSpeed(0.75);
                                },
                                child: const Text('0.75'),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.setSpeed(1.0);
                                },
                                child: const Text('Normal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.setSpeed(1.25);
                                },
                                child: const Text('1.25'),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.setSpeed(1.5);
                                },
                                child: const Text('1.5'),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.setSpeed(1.75);
                                },
                                child: const Text('1.75'),
                              ),
                            ],
                          ),
                        ));
                      },
                      iconSize: 25.sp,
                      icon: const Icon(
                        Icons.speed,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.next();
                      },
                      iconSize: 25.sp,
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
    );
  }
}
