import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_nav_controller.dart';
import '../main_nav_config.dart';

class MainNavView extends GetView<MainNavController> {
  const MainNavView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = MainNavConfig.items;

    return Obx(
      () {
        final safeIndex = controller.selectedIndex.value.clamp(0, items.length - 1);

        return Scaffold(
          body: IndexedStack(
            index: safeIndex,
            children: [
              for (final item in items) item.page(),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 75,
            index: safeIndex,
            onTap: controller.changeTab,
            backgroundColor: Colors.transparent,
            color: AppColors.primary,
            buttonBackgroundColor: AppColors.primary,
            animationDuration: const Duration(milliseconds: 280),
            items: [
              for (var i = 0; i < items.length; i++)
                _navItem(
                  icon: items[i].icon,
                  label: items[i].label,
                  isActive: safeIndex == i,
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    if (isActive) {
      return Icon(icon, color: Colors.white, size: 26);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: 26),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
