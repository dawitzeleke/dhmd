import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;

  final count = 0.obs;



  void increment() => count.value++;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }
}
