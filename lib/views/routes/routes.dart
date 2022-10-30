import 'package:get/get.dart';
import 'package:music_streaming_app/views/pages/audio_page/audio_player_page.dart';
import 'package:music_streaming_app/views/pages/root_page/root_page.dart';

class Routes {
  static const String initialPage = '/';
  static const String audioPlayerPage = '/audioPlayerPage';

  static var list = [
    GetPage(
      name: initialPage,
      page: () => Rootpage(),
    ),
    GetPage(
      name: audioPlayerPage,
      page: () => AudioPlayerPage(),
    ),
  ];
}
