import 'package:get/get.dart';
import 'package:music_streaming_app/views/pages/root_page/root_page.dart';

class Routes {
  static const String rootPage = '/rootPage';

  static var list = [
    GetPage(
      name: rootPage,
      page: () => const RootPage(),
    ),
  ];
}
