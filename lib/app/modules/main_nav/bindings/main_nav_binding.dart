import 'package:get/get.dart';

import '../controllers/main_nav_controller.dart';
import '../main_nav_config.dart';

class MainNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavController>(() => MainNavController());
    for (final item in MainNavConfig.items) {
      item.binding().dependencies();
    }
  }
}
