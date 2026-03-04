import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// App bar with white background, optional back button and title in primary (light blue).
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.onBack,
    this.showBackButton = true,
    this.actions,
  });

  final String? title;
  final VoidCallback? onBack;
  final bool showBackButton;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primary, size: 22),
              onPressed: onBack ?? () => Navigator.of(context).maybePop(),
              padding: const EdgeInsets.symmetric(horizontal: 4),
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
      titleSpacing: showBackButton ? 0 : 16,
      centerTitle: false,
      actions: actions,
    );
  }
}
