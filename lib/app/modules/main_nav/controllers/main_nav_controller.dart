import 'package:get/get.dart';

import '../main_nav_config.dart';

class MainNavController extends GetxController {
  MainNavController({MainNavPreset preset = MainNavPreset.clinic}) : preset = preset.obs;

  final selectedIndex = 0.obs;
  final Rx<MainNavPreset> preset;

  List<MainNavItem> get items => MainNavConfig.itemsFor(preset.value);

  int get tabCount => items.length;

  void setPreset(MainNavPreset value) {
    preset.value = value;
    selectedIndex.value = selectedIndex.value.clamp(0, tabCount - 1);
  }

  void changeTab(int index) {
    selectedIndex.value = index.clamp(0, tabCount - 1);
  }
}
