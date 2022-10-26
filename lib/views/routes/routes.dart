import 'package:get/get.dart';
import 'package:music_streaming_app/views/pages/audio_page/audio_player_widget.dart';

class Routes {
  static const String initialPage = '/';

  static var list = [
    GetPage(
      name: initialPage,
      page: () => const AudioPlayerWidget(),
    ),
  ];
}
