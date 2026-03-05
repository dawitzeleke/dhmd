import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import 'widgets/profile_menu_tile.dart';
import 'widgets/profile_user_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 16, 22, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1B1F2D),
                ),
              ),
              const SizedBox(height: 16),
              ProfileUserCard(
                name: controller.userName,
                email: controller.userEmail,
              ),
              const SizedBox(height: 20),
              const Text(
                'General',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF161925),
                ),
              ),
              const SizedBox(height: 8),
              const ProfileMenuTile(
                icon: Icons.person_outline,
                title: 'Account Information',
                subtitle: 'Change your account information',
                showDivider: true,
              ),
              const SizedBox(height: 6),
              const ProfileMenuTile(
                icon: Icons.settings_outlined,
                title: 'Settings',
                subtitle: 'Manage & Settings',
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
