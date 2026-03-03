import 'package:dhmd/app/components/auth/auth_shell.dart';
import 'package:dhmd/app/routes/app_pages.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  Widget _otpBox() {
    return SizedBox(
      width: 44,
      height: 44,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.zero,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.2),
          ),
        ),
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
      title: 'Check your phone',
      subtitle: 'We sent a code to 09123456789 enter 6 digit code\nthat mentioned in the email',
      buttonText: 'Verify Code',
      onButtonPressed: () => Get.toNamed(Routes.PASSWORD_RESET),
      formContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (_) => _otpBox()),
          ),
          const SizedBox(height: 12),
          Obx(
            () => Text(
              controller.timerText,
              style: const TextStyle(
                color: Color(0xFF8A94A6),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Haven’t got the sms yet? ',
                style: TextStyle(color: Color(0xFF8A94A6), fontSize: 14),
              ),
              InkWell(
                onTap: controller.resendCode,
                child: const Text(
                  'Resend',
                  style: TextStyle(
                    color: Color(0xFF303B4E),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
