
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double textSize;
  final double borderRadius;
  final double height;
  final double? width;
  final bool isLoading;
  final bool hasBorderSide;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    required this.textSize,
    this.borderRadius = 8.0,
    this.height = 50.0,
    this.width,
    this.isLoading = false,
    this.hasBorderSide = false,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: hasBorderSide ? BorderSide(color: AppColors.onPrimary, width: 2) : BorderSide.none,
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(
                text,
                style: TextStyle(color: textColor, fontSize: textSize),
              ),
      ),
    );
  }
}