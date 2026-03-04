import 'package:get/get.dart';

class LoginController extends GetxController {
  final isPasswordHidden = true.obs;

  final count = 0.obs;



  void increment() => count.value++;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
