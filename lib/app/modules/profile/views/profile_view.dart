import 'package:dhmd/core/constants/app_colors.dart';
import 'package:dhmd/app/components/app_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import 'widgets/profile_edit_value_row.dart';
import 'widgets/profile_gender_selector.dart';
import 'widgets/profile_info_item.dart';
import 'widgets/profile_menu_tile.dart';
import 'widgets/profile_settings_action_tile.dart';
import 'widgets/profile_settings_toggle_tile.dart';
import 'widgets/profile_user_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(22, 16, 22, 20),
            child: controller.isEditAccountOpen.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: controller.closeEditAccount,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Edit Account',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 31,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Personal',
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const ProfileEditValueRow(
                              label: 'Card Id',
                              value: '1092302',
                            ),
                            const SizedBox(height: 12),
                            const ProfileEditValueRow(
                              label: 'Title',
                              value: 'zhafira',
                            ),
                            const SizedBox(height: 12),
                            const ProfileEditValueRow(
                              label: 'First Name',
                              value: 'Girma',
                            ),
                            const SizedBox(height: 12),
                            const ProfileEditValueRow(
                              label: 'Last Name',
                              value: 'Tefera',
                            ),
                            const SizedBox(height: 12),
                            const ProfileEditValueRow(
                              label: 'Date of Birth',
                              value: 'Feb 12, 1994',
                              trailing: Icon(
                                Icons.calendar_month_outlined,
                                color: Color(0xFF7B8EA9),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF8A9AB0),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Obx(
                              () => ProfileGenderSelector(
                                isMale: controller.isMale.value,
                                onChanged: controller.selectGender,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Divider(height: 1, color: Color(0xFFDCE3ED)),
                            const SizedBox(height: 16),
                            const Text(
                              'Contact',
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const ProfileEditValueRow(
                              label: 'Type your phone number',
                              value: '+251-912345678',
                              trailing: Icon(
                                Icons.phone_outlined,
                                color: Color(0xFF1F2430),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const ProfileEditValueRow(
                              label: 'Type your email',
                              value: 'girma@gmail.com',
                              trailing: Icon(
                                Icons.mail_outline,
                                color: Color(0xFF7B8EA9),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 34),
                      Center(
                        child: AppButton(
                          text: 'Save Changes',
                          onPressed: controller.saveEditAccount,
                          textSize: 14,
                          width: 170,
                          height: 42,
                          borderRadius: 10,
                        ),
                      ),
                    ],
                  )
                : controller.isAccountInfoOpen.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: controller.closeAccountInfo,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Account Infomation',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 31,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 34),
                      Row(
                        children: [
                          const Text(
                            'Personal',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: controller.openEditAccount,
                            child: const Icon(
                              Icons.edit_outlined,
                              color: AppColors.primary,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(14, 18, 14, 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ProfileInfoItem(
                                    label: 'Card Id',
                                    value: '1092302',
                                  ),
                                ),
                                Expanded(
                                  child: ProfileInfoItem(
                                    label: 'Title',
                                    value: 'Col...',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 18),
                            Row(
                              children: [
                                Expanded(
                                  child: ProfileInfoItem(
                                    label: 'First Name',
                                    value: 'Girma',
                                  ),
                                ),
                                Expanded(
                                  child: ProfileInfoItem(
                                    label: 'Last Name',
                                    value: 'Tefera',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 18),
                            Row(
                              children: [
                                Expanded(
                                  child: ProfileInfoItem(
                                    label: 'Date of Birth',
                                    value: 'Feb 12, 1980',
                                  ),
                                ),
                                Expanded(
                                  child: ProfileInfoItem(
                                    label: 'Gender',
                                    value: 'Male',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 26),
                      const Text(
                        'Contact',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(14, 18, 14, 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ProfileInfoItem(
                                    label: 'Phone Number',
                                    value: '081892319321',
                                  ),
                                ),
                                Expanded(
                                  child: ProfileInfoItem(
                                    label: 'Email',
                                    value: 'zhafir@gmail.com',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 18),
                            Row(
                              children: [
                                Expanded(
                                  child: ProfileInfoItem(
                                    label: 'City',
                                    value: 'Bandung',
                                  ),
                                ),
                                Expanded(
                                  child: ProfileInfoItem(
                                    label: 'Province',
                                    value: 'West Java',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 18),
                            Row(
                              children: [
                                Expanded(
                                  child: ProfileInfoItem(
                                    label: 'Address',
                                    value: 'Jl. Sekar Wangi 20 A, Bancangan',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  )
                : controller.isSettingsOpen.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: controller.closeSettings,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 31,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Account settings',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF253045),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const ProfileSettingsActionTile(
                        icon: Icons.lock_outline,
                        iconBg: Color(0xFFFF6D6D),
                        title: 'Change Password',
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      const ProfileSettingsActionTile(
                        icon: Icons.notifications_none,
                        iconBg: Color(0xFF2FA45E),
                        title: 'Notifications',
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      const ProfileSettingsActionTile(
                        icon: Icons.pie_chart_outline,
                        iconBg: AppColors.primary,
                        title: 'Statistics',
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      const ProfileSettingsActionTile(
                        icon: Icons.people_alt_outlined,
                        iconBg: Color(0xFFF6A147),
                        title: 'About us',
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      const SizedBox(height: 26),
                      const Text(
                        'More options',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF253045),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ProfileSettingsToggleTile(
                        title: 'Text messages',
                        value: controller.textMessagesEnabled.value,
                        onChanged: controller.setTextMessages,
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      ProfileSettingsToggleTile(
                        title: 'Phone calls',
                        value: controller.phoneCallsEnabled.value,
                        onChanged: controller.setPhoneCalls,
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      ProfileSettingsToggleTile(
                        title: 'Video Call',
                        value: controller.videoCallEnabled.value,
                        onChanged: controller.setVideoCall,
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      const SizedBox(height: 6),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Languages',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF1F2430),
                                ),
                              ),
                            ),
                            Text(
                              'English',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666E7F),
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.chevron_right,
                              color: Color(0xFF2A3140),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      const SizedBox(height: 80),
                      const Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.logout, color: Colors.black, size: 24),
                            SizedBox(width: 10),
                            Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )
                : Column(
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
                      ProfileMenuTile(
                        icon: Icons.person_outline,
                        title: 'Account Information',
                        subtitle: 'Change your account information',
                        showDivider: true,
                        onTap: controller.openAccountInfo,
                      ),
                      const SizedBox(height: 6),
                      ProfileMenuTile(
                        icon: Icons.settings_outlined,
                        title: 'Settings',
                        subtitle: 'Manage & Settings',
                        onTap: controller.openSettings,
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
