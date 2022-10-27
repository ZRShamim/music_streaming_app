import 'package:get/get.dart';
import 'package:music_streaming_app/views/pages/audio_page/audio_player_widget.dart';
import 'package:music_streaming_app/views/pages/root_page/root_page.dart';

class Routes {
  static const String initialPage = '/';

  static var list = [
    GetPage(
      name: initialPage,
      page: () => Rootpage(),
    ),
  ];
}
