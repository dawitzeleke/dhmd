import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/clinic_controller.dart';

class ClinicHomeView extends GetView<ClinicController> {
  const ClinicHomeView({super.key});

  static const List<_SpecialtyItem> _specialties = [
    _SpecialtyItem(title: 'Neurology', doctorCount: 10, icon: Icons.psychology_rounded),
    _SpecialtyItem(title: 'Cardiologist', doctorCount: 2, icon: Icons.favorite_rounded),
    _SpecialtyItem(title: 'Dentistry', doctorCount: 1, icon: Icons.medical_services_rounded),
  ];

  static const List<_DoctorItem> _doctors = [
    _DoctorItem(
      name: 'Dr. Tesfaye Alemayehu',
      imagePath: 'assets/images/doctor.png',
      specialty: 'Cardiology',
      subSpecialty: 'Interventional Cardiology',
      experience: '10+ Years',
      qualification: 'MD, Specialty Certification',
      rating: 4,
    ),
    _DoctorItem(
      name: 'Dr. Helina Alemayehu',
      imagePath: 'assets/images/defence.png',
      specialty: 'Endocrinology',
      subSpecialty: 'Diabetes & Metabolic Disorders',
      experience: '8 Years',
      qualification: 'MD, Endocrinology Fellowship',
      rating: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildCategoryFilters(),
              const SizedBox(height: 24),
              _buildSpecialtySection(),
              const SizedBox(height: 24),
              _buildRecommendedDoctors(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 24, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/doctor.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 50,
                height: 50,
                color: AppColors.primary.withValues(alpha: 0.3),
                child: const Icon(Icons.person, color: AppColors.primary, size: 28),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, Ashenafi Mamo!',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'VIP clinic GP',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.notifications_outlined, size: 24, color: Colors.grey[700]),
          const SizedBox(width: 18),
          Icon(Icons.more_vert, size: 24, color: Colors.grey[700]),
        ],
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return Obx(
      () {
        final index = controller.selectedCategoryIndex.value;
        const labels = ['Adults', 'Children', 'Men'];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              for (var i = 0; i < labels.length; i++)
                Padding(
                  padding: EdgeInsets.only(right: i < labels.length - 1 ? 12 : 0),
                  child: GestureDetector(
                    onTap: () => controller.setCategory(i),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: index == i ? AppColors.primary : Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: index == i ? AppColors.primary : AppColors.primary.withValues(alpha: 0.5),
                        ),
                      ),
                      child: Text(
                        labels[i],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: index == i ? Colors.white : const Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSpecialtySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Specialty',
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'All',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _specialties.length,
            itemBuilder: (context, i) {
              final item = _specialties[i];
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _SpecialtyCard(
                  title: item.title,
                  doctorCount: item.doctorCount,
                  icon: item.icon,
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedDoctors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recommended Doctors',
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'All',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _doctors.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _DoctorCard(item: _doctors[i], onTap: () {}),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SpecialtyItem {
  const _SpecialtyItem({
    required this.title,
    required this.doctorCount,
    required this.icon,
  });
  final String title;
  final int doctorCount;
  final IconData icon;
}

class _SpecialtyCard extends StatelessWidget {
  const _SpecialtyCard({
    required this.title,
    required this.doctorCount,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final int doctorCount;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E7EB)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: AppColors.primary),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$doctorCount Doctors',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorItem {
  const _DoctorItem({
    required this.name,
    required this.imagePath,
    required this.specialty,
    required this.subSpecialty,
    required this.experience,
    required this.qualification,
    required this.rating,
  });
  final String name;
  final String imagePath;
  final String specialty;
  final String subSpecialty;
  final String experience;
  final String qualification;
  final double rating;
}

class _DoctorCard extends StatelessWidget {
  const _DoctorCard({required this.item, required this.onTap});

  final _DoctorItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E7EB)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    item.imagePath,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 120,
                      color: AppColors.primary.withValues(alpha: 0.2),
                      child: const Icon(Icons.person, color: AppColors.primary, size: 48),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF22C55E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Available',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: AppColors.primary,
              child: Center(
                child: Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.specialty,
                    style: const TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.subSpecialty,
                    style: const TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.experience,
                    style: const TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.qualification,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (i) {
                      final filled = item.rating > i;
                      return Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: Icon(
                          filled ? Icons.star_rounded : Icons.star_outline_rounded,
                          size: 16,
                          color: filled ? const Color(0xFFFBBF24) : Colors.grey[400],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
