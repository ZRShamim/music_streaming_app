import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_streaming_app/models/audio.dart';

class AudioPlayerController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();

  RxBool isPLaying = false.obs;

  Rx<Duration> duration = Duration.zero.obs;
  Rx<Duration> position = Duration.zero.obs;
  Rx<Duration> bufferPosition = Duration.zero.obs;

  List<Audio> audioList = [
    Audio(
      title: 'Caught',
      subtitle: 'Caught Audio Book Sample',
      url: 'https://www.harlancoben.com/audio/CaughtSample.mp3',
    ),
    Audio(
      title: 'Darkest Fear',
      subtitle: 'Darkest Fear Audio Book Sample',
      url: 'https://www.harlancoben.com/audio/DarkestFear2minExtract.mp3',
    ),
    Audio(
      title: 'Just One Look',
      readBy: 'Carolyn McCormick',
      subtitle: 'Just One Look Audio Book Sample',
      url: 'https://www.harlancoben.com/audio/LongLost-01.mp3',
    ),
    Audio(
      title: 'Hold Tight',
      readBy: 'Scott brick',
      subtitle: 'Hold Tight Audio Book Sample',
      url: 'https://www.harlancoben.com/audio/Coben_Hold_Tight_Chapter1.mp3',
    ),
    Audio(
      title: 'Gone For Good',
      subtitle: 'Gone For Good Audio Book Sample',
      url: 'https://www.harlancoben.com/audio/GoneForGood2minExtract.mp3',
    ),
    Audio(
      title: 'The Woods',
      readBy: 'Scott brick',
      subtitle: 'The Woods Audio Book Sample',
      url: 'https://www.harlancoben.com/audio/TheWoods-01.mp3',
    )
  ];

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
      if (position.value == Duration.zero) {
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
