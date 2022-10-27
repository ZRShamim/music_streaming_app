import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();

  RxBool isPLaying = false.obs;

  Rx<Duration> duration = Duration.zero.obs;
  Rx<Duration> position = Duration.zero.obs;
  Rx<Duration> bufferPosition = Duration.zero.obs;

  RxString _tempUrl = ''.obs;

  @override
  void onInit() {
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

  void playAudio(String url) async {
    if (isPLaying.value) {
      await _audioPlayer.pause();
    } else {
      if (_tempUrl.value != url) {
        _tempUrl.value = url;
        // if (position.value == Duration.zero) {
        // set audio source
        await _audioPlayer.setUrl(url);
        // getting the duration of the audio
        duration.value = _audioPlayer.duration ?? Duration.zero;
        if (duration.value != Duration.zero) {
          // if have duration play
          _audioPlayer.play();
        }
      } else {
        _audioPlayer.play();
      }
    }
  }

  void onSeek(Duration duration) {
    _audioPlayer.seek(duration);
  }
}
