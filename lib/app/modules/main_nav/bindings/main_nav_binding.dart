import 'package:get/get.dart';

import '../controllers/main_nav_controller.dart';
import '../main_nav_config.dart';

class MainNavBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments;
    final preset = args is Map
        ? mainNavPresetFrom(args['preset'] ?? args['role'])
        : mainNavPresetFrom(args);

    Get.lazyPut<MainNavController>(() => MainNavController(preset: preset));

    for (final item in MainNavConfig.itemsFor(preset)) {
      item.binding().dependencies();
    }
  }
}
