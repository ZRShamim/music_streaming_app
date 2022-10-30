import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_streaming_app/controllers/audio_controller.dart';
import 'package:music_streaming_app/models/audio.dart';

class AudioPlayerController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();

  RxBool isPLaying = false.obs;

  Rx<Duration> duration = Duration.zero.obs;
  Rx<Duration> position = Duration.zero.obs;
  Rx<Duration> bufferPosition = Duration.zero.obs;

  Rx<int> currentStreamIndex = 0.obs;
  var audioList = <Audio>[].obs;

  // final RxString _tempUrl = ''.obs;

  @override
  void onInit() {
    final AudioController audioController = Get.put(AudioController());

    audioList = audioController.audioList;

    getAudio();

    _audioPlayer.positionStream.listen((newPosition) {
      position.value = newPosition;
    });
    _audioPlayer.bufferedPositionStream.listen((newBufferPostion) {
      bufferPosition.value = newBufferPostion;
    });
    _audioPlayer.playerStateStream.listen((state) {
      isPLaying.value = _audioPlayer.playerState.playing;
    });
    super.onInit();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void smartPlay() async {
    print('smart play');
    if (isPLaying.value) {
      pause();
    } else {
      resume();
    }
  }

  void play() async {
    print('play');
    if (isPLaying.value || position.value != Duration.zero) {
      stop();
    }
    getAudio();
    resume();
  }

  void resume() async {
    _audioPlayer.play();
  }

  void pause() async {
    print('pause');
    await _audioPlayer.pause();
  }

  void stop() async {
    print('stop');
    await _audioPlayer.stop().then((_) {
      position.value = Duration.zero;
    });
  }

  void next() async {
    print('next');
    if (currentStreamIndex.value == audioList.length - 1) {
      currentStreamIndex.value = 0;
      play();
    } else {
      currentStreamIndex.value++;
      play();
    }
  }

  void back() async {
    print('back');
    if (currentStreamIndex.value == 0) {
      currentStreamIndex.value = audioList.length - 1;
      play();
    } else {
      currentStreamIndex.value--;
      play();
    }
    // s
  }

  void setSpeed(double speed) async {
    await _audioPlayer.setSpeed(speed);
  }

  void backwardTen() async {}

  Future<void> getAudio() async {
    try {
      await _audioPlayer
          .setUrl(audioList[currentStreamIndex.value].url)
          .then((value) {
        setSpeed(1.0);
        duration.value = _audioPlayer.duration!;
      });
    } catch (e) {
      isPLaying.value = false;
      Get.snackbar(
        'Error',
        'Somthing went wrong!',
        backgroundColor: Colors.redAccent,
      );
    }
  }

  void onSeek(Duration duration) {
    _audioPlayer.seek(duration);
  }
}
// }
