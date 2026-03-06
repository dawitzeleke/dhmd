import 'package:get/get.dart';

import '../../appointment/controllers/appointment_controller.dart';
import '../../history/controllers/history_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/main_nav_controller.dart';

class MainNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavController>(() => MainNavController(), fenix: true);
    Get.lazyPut<AppointmentController>(
      () => AppointmentController(),
      fenix: true,
    );
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<HistoryController>(() => HistoryController(), fenix: true);
  }
}
