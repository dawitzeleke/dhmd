import 'package:dhmd/app/components/app_button.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AuthShell extends StatelessWidget {
  final Widget headerIcon;
  final String title;
  final String? subtitle;
  final Widget? formContent;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final double cardHeight;

  const AuthShell({
    super.key,
    required this.headerIcon,
    required this.title,
    this.subtitle,
    this.formContent,
    required this.buttonText,
    required this.onButtonPressed,
    this.cardHeight = 681,
  });

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
                child: Center(
                  child: Image.asset(
                    'assets/images/defence.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Positioned(
                left: 30,
                right: 30,
                bottom: 60,
                child: Container(
                  height: cardHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(child: headerIcon),
                        const SizedBox(height: 20),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        subtitle != null ? Text(
                          subtitle!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                          ),
                        ) : const SizedBox.shrink(),
                        const SizedBox(height: 32),
                        Expanded(child: formContent ?? const SizedBox.shrink()),
                        const SizedBox(height: 20),
                        Center(
                          child: AppButton(
                            text: buttonText,
                            onPressed: onButtonPressed,
                            textSize: 24,
                            borderRadius: 20,
                            width: 252,
                            hasBorderSide: true,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
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
