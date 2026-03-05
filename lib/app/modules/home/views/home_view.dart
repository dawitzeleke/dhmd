import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'widgets/consultation_history_section.dart';
import 'widgets/home_good_hands_banner.dart';
import 'widgets/home_search_section.dart';
import 'widgets/home_top_header.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  static const List<ConsultationItem> _consultations = [
    ConsultationItem(
      name: 'Dr. Tesfaye Alemayehu',
      specialty: 'Specialist Cardiologist',
      rating: 4,
      imagePath: 'assets/images/doctor.png',
      isOnline: true,
      isFavorite: true,
    ),
    ConsultationItem(
      name: 'Dr. Tesfaye Alemayehu',
      specialty: 'Specialist Dentist',
      rating: 4,
      imagePath: 'assets/images/person.png',
      isOnline: false,
      isFavorite: true,
    ),
    ConsultationItem(
      name: 'Dr. Helina Alemayehu',
      specialty: 'Specialist Cancer',
      rating: 4,
      imagePath: 'assets/images/defence.png',
      isOnline: false,
      isFavorite: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTopHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeSearchSection(),
                  const SizedBox(height: 16),
                  HomeGoodHandsBanner(
                    onBookNow: () => Get.toNamed(Routes.BOOKING),
                    imagePath: 'assets/images/book_banner.png',
                  ),
                  const SizedBox(height: 28),
                  ConsultationHistorySection(items: _consultations),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
