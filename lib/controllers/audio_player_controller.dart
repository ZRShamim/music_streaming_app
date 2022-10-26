import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();

  RxBool isPLaying = false.obs;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  Duration bufferPosition = Duration.zero;

  @override
  void onInit() {
    // audioPlayer.positionStream.listen((newPosition) {
    //   position = newPosition;
    // });
    // audioPlayer.bufferedPositionStream.listen((newBufferPostion) {
    //   bufferPosition = newBufferPostion;
    // });
    audioPlayer.playerStateStream.listen((state) {
      isPLaying.value = audioPlayer.playerState.playing;
      print(isPLaying);
    });
    // TODO: implement onInit
    super.onInit();
  }
}
