import 'package:dhmd/app/components/auth/auth_shell.dart';
import 'package:dhmd/app/routes/app_pages.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/password_reset_controller.dart';

class PasswordResetView extends GetView<PasswordResetController> {
  const PasswordResetView({super.key});
  @override
  Widget build(BuildContext context) {
     return AuthShell(
      headerIcon: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.lock_outline, color: Colors.white, size: 45),
      ),
      title: 'Password Reset',
      subtitle: 'Your password has been successfully reset. click confirm to set a new password',
      buttonText: 'Confirm',
      onButtonPressed: () => Get.toNamed(Routes.NEW_PASSWORD), 
      formContent: null,
    );
  }
}
