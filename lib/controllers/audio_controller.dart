import 'package:get/get.dart';
import 'package:music_streaming_app/models/audio.dart';

class AudioController extends GetxController {
  RxList<Audio> audioList = <Audio>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAudio();
  }

  void fetchAudio() {
    List<Audio> serverResponse = [
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
    audioList.value = serverResponse;
  }
}
