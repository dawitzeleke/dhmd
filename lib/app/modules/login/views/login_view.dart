import 'package:dhmd/app/components/app_button.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  InputDecoration _fieldDecoration({
    required String hintText,
    Widget? suffixIcon,
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
    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final diameter = constraints.maxWidth * 1.8;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -diameter * 0.6,
                left: (constraints.maxWidth - diameter) / 2,
                child: Container(
                  width: diameter,
                  height: diameter,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/defence.png",
                  width: 150,
                  height: 150,
                  // fit: BoxFit.contain,
                ),
              ),

              Positioned(
                left: 30,
                right: 30,
                bottom: 60,
                child: Container(
                  height: 681,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        "assets/images/person.png",
                        width: 50,
                        height: 57,
                        // fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Welcome To\nTelehealth Service",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'phone number',
                              style: TextStyle(
                                color: Color(0xFF4A5568),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 8),

                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: _fieldDecoration(
                                hintText: '(+251_9 *** ****)',
                              ),
                            ),
                            const SizedBox(height: 18),
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
                                  hintText: 'Password',
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

                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 100),

                            Center(
                              child: AppButton(
                                text: "Sign In",
                                onPressed: () => {},
                                textSize: 24,
                                borderRadius: 20,
                                width: 252,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
