import 'package:get/get.dart';

import '../../profile/controllers/profile_controller.dart';
import '../controllers/main_nav_controller.dart';

class MainNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavController>(() => MainNavController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
