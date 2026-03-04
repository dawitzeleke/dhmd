import 'package:get/get.dart';

class ClinicController extends GetxController {
  /// 0 = Adults, 1 = Children, 2 = Men
  final selectedCategoryIndex = 0.obs;

  void setCategory(int index) {
    selectedCategoryIndex.value = index.clamp(0, 2);
  }

  // TODO: Load specialties and recommended doctors from API
}
