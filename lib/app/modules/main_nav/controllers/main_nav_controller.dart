import 'package:get/get.dart';

class MainNavController extends GetxController {
  final selectedIndex = 0.obs;
  static const int tabCount = 4;

  void changeTab(int index) {
    selectedIndex.value = index.clamp(0, tabCount - 1);
  }
}
