import 'package:dhmd/app/modules/home/views/home_view.dart';
import 'package:dhmd/app/modules/history/views/history_view.dart';
import 'package:dhmd/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:get/get.dart';

import 'package:dhmd/core/constants/app_colors.dart';

import '../controllers/main_nav_controller.dart';

class MainNavView extends GetView<MainNavController> {
  const MainNavView({super.key});

  List<Widget> get _tabs => const [
    HomeView(),
    _TabPlaceholder(title: 'Appointment'),
    HistoryView(),
    ProfileView(),
  ];

  Widget _navItem({
    required String icon,
    required String label,
    required bool isActive,
  }) {
    if (isActive) {
      return SizedBox(
        width: 28,
        height: 28,
        child: Image.asset(icon, color: Colors.white, fit: BoxFit.contain),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Image.asset(icon, color: Colors.white, width: 24, height: 24),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final safeIndex = controller.selectedIndex.value.clamp(
        0,
        _tabs.length - 1,
      );

      return Scaffold(
        body: IndexedStack(index: safeIndex, children: _tabs),
        bottomNavigationBar: CurvedNavigationBar(
          height: 75,
          index: safeIndex,
          onTap: controller.changeTab,
          backgroundColor: Colors.transparent,
          color: AppColors.primary,
          buttonBackgroundColor: AppColors.primary,
          animationDuration: const Duration(milliseconds: 280),
          items: [
            _navItem(
              icon: 'assets/navbar/home.png',
              label: 'Home',
              isActive: safeIndex == 0,
            ),
            _navItem(
              icon: 'assets/navbar/appointment.png',
              label: 'Appointment',
              isActive: safeIndex == 1,
            ),
            _navItem(
              icon: 'assets/navbar/history.png',
              label: 'History',
              isActive: safeIndex == 2,
            ),
            _navItem(
              icon: 'assets/navbar/profile.png',
              label: 'Profile',
              isActive: safeIndex == 3,
            ),
          ],
        ),
      );
    });
  }
}

class _TabPlaceholder extends StatelessWidget {
  final String title;

  const _TabPlaceholder({required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          '$title Page',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
