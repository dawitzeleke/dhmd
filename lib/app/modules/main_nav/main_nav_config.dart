import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../clinic/bindings/clinic_binding.dart';
import '../clinic/views/clinic_home_view.dart';
import '../history/bindings/history_binding.dart';
import '../history/views/history_view.dart';
import '../profile/bindings/profile_binding.dart';
import '../profile/views/profile_view.dart';

/// Reusable definition of a single main nav tab.
/// Each module provides its own [page] and [binding].
class MainNavItem {
  const MainNavItem({
    required this.label,
    required this.icon,
    required this.binding,
    required this.page,
  });

  final String label;
  final IconData icon;
  final Bindings Function() binding;
  final Widget Function() page;
}

/// Config for the main bottom nav. Change the list to use 3 or 4 (or more) tabs.
/// Controllers live in their respective modules; this only wires label, icon, page, and binding.
class MainNavConfig {
  MainNavConfig._();

  static List<MainNavItem> get items => [
    MainNavItem(
      label: 'Home',
      icon: Icons.home_rounded,
      binding: () => ClinicBinding(),
      page: () => const ClinicHomeView(),
    ),
    MainNavItem(
      label: 'History',
      icon: Icons.history_rounded,
      binding: () => HistoryBinding(),
      page: () => const HistoryView(),
    ),
    MainNavItem(
      label: 'Profile',
      icon: Icons.person_rounded,
      binding: () => ProfileBinding(),
      page: () => const ProfileView(),
    ),
    // Add a 4th item here when needed, e.g.:
    // MainNavItem(
    //   label: 'Appointments',
    //   icon: Icons.calendar_today_rounded,
    //   binding: () => AppointmentsBinding(),
    //   page: () => const AppointmentsView(),
    // ),
  ];
}
