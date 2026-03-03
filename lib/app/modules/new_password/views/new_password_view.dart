import 'package:dhmd/app/components/auth/auth_shell.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({super.key});

  InputDecoration _fieldDecoration({
    required String hintText,
    required Widget suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }

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
      title: "Set a new password", 
      subtitle: "Create a new password. Ensure it differs from previous ones for security", 
      buttonText: 'Update Password', onButtonPressed: () {},
      formContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Password',
            style: TextStyle(
              color: Color(0xFF4A5568),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Obx(
            () => TextFormField(
              obscureText: controller.isPasswordHidden.value,
              decoration: _fieldDecoration(
                hintText: 'Enter new password',
                suffixIcon: IconButton(
                  onPressed: controller.togglePasswordVisibility,
                  icon: Icon(
                    controller.isPasswordHidden.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey.shade400,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            'Confirm Password',
            style: TextStyle(
              color: Color(0xFF4A5568),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Obx(
            () => TextFormField(
              obscureText: controller.isConfirmPasswordHidden.value,
              decoration: _fieldDecoration(
                hintText: 'Confirm new password',
                suffixIcon: IconButton(
                  onPressed: controller.toggleConfirmPasswordVisibility,
                  icon: Icon(
                    controller.isConfirmPasswordHidden.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey.shade400,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
