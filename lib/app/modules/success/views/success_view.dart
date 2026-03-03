import 'package:dhmd/app/components/auth/auth_shell.dart';
import 'package:dhmd/app/routes/app_pages.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/success_controller.dart';

class SuccessView extends GetView<SuccessController> {
  const SuccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return AuthShell( 
      buttonText: "Done",
      onButtonPressed: () => Get.offAllNamed(Routes.LOGIN),
      formContent: Column(children: [
        Text(
          "Successful",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Congratulations! Your password has been changed. Click continue to login",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],),
    );
  }
}
