import 'package:get/get.dart';

import '../main_nav_config.dart';

class MainNavController extends GetxController {
  final selectedIndex = 0.obs;

  int get tabCount => MainNavConfig.items.length;

  void changeTab(int index) {
    selectedIndex.value = index.clamp(0, tabCount - 1);
  }
}
