import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../appointments/bindings/appointments_binding.dart';
import '../appointments/views/appointments_view.dart';
import '../clinic/bindings/clinic_binding.dart';
import '../clinic/views/clinic_appointments_view.dart';
import '../clinic/views/clinic_home_view.dart';
import '../home/bindings/home_binding.dart';
import '../home/views/home_view.dart';
import '../history/bindings/history_binding.dart';
import '../history/views/history_view.dart';
import '../profile/bindings/profile_binding.dart';
import '../profile/views/profile_view.dart';

/// Defines which bottom-nav layout to use (role / screen preset).
enum MainNavPreset {
  /// Clinic/doctor home (3 tabs).
  clinic,

  /// Patient app shell (4 tabs).
  patient,

  /// Specialist shell (4 tabs including requests).
  specialist,
}

MainNavPreset mainNavPresetFrom(dynamic value, {MainNavPreset fallback = MainNavPreset.clinic}) {
  if (value == null) return fallback;
  if (value is MainNavPreset) return value;
  final s = value.toString().toLowerCase().replaceAll(' ', '').replaceAll('_', '');
  switch (s) {
    case 'clinic':
    case 'clininic':
      return MainNavPreset.clinic;
    case 'patient':
      return MainNavPreset.patient;
    case 'specialist':
      return MainNavPreset.specialist;
    default:
      return fallback;
  }
}

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

  /// Backwards-compatible default (clinic preset).
  static List<MainNavItem> get items => itemsFor(MainNavPreset.clinic);

  static List<MainNavItem> itemsFor(MainNavPreset preset) {
    switch (preset) {
      case MainNavPreset.clinic:
        return const [
          MainNavItem(
            label: 'Home',
            icon: Icons.home_rounded,
            binding: ClinicBinding.new,
            page: ClinicHomeView.new,
          ),
          MainNavItem(
            label: 'Appointments',
            icon: Icons.history_rounded,
            binding: HistoryBinding.new,
            page: ClinicAppointmentView.new,
          ),
          MainNavItem(
            label: 'Profile',
            icon: Icons.person_rounded,
            binding: ProfileBinding.new,
            page: ProfileView.new,
          ),
        ];
      case MainNavPreset.specialist:
        return const [
          MainNavItem(
            label: 'Home',
            icon: Icons.home_rounded,
            binding: ClinicBinding.new,
            page: ClinicAppointmentView.new,
          ),
          MainNavItem(
            label: 'Appointments',
            icon: Icons.person_2,
            binding: ClinicBinding.new,
            page: ClinicHomeView.new,
          ),
          MainNavItem(
            label: 'History',
            icon: Icons.history_rounded,
            binding: HistoryBinding.new,
            page: HistoryView.new,
          ),
          MainNavItem(
            label: 'Profile',
            icon: Icons.person_rounded,
            binding: ProfileBinding.new,
            page: ProfileView.new,
          ),
        ];
      case MainNavPreset.patient:
        return const [
          MainNavItem(
            label: 'Home',
            icon: Icons.home_rounded,
            binding: HomeBinding.new,
            page: HomeView.new,
          ),
          MainNavItem(
            label: 'Appointments',
            icon: Icons.calendar_today_rounded,
            binding: AppointmentsBinding.new,
            page: AppointmentsView.new,
          ),
          MainNavItem(
            label: 'History',
            icon: Icons.history_rounded,
            binding: HistoryBinding.new,
            page: HistoryView.new,
          ),
          MainNavItem(
            label: 'Profile',
            icon: Icons.person_rounded,
            binding: ProfileBinding.new,
            page: ProfileView.new,
          ),
        ];
    }
  }
}
