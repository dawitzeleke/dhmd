import 'package:get/get.dart';

enum ConsultationStatus { all, pending, rejected }

class HistoryConsultationItem {
  const HistoryConsultationItem({
    required this.id,
    required this.status,
    required this.doctorName,
    required this.imagePath,
    required this.specialty,
    required this.subSpecialty,
    required this.experience,
    required this.qualification,
    this.rating = 0.0,
  });

  final String id;
  final ConsultationStatus status;
  final String doctorName;
  final String imagePath;
  final String specialty;
  final String subSpecialty;
  final String experience;
  final String qualification;
  final double rating;
}

class HistoryController extends GetxController {
  final selectedFilterIndex = 0.obs;

  static const List<HistoryConsultationItem> _allItems = [
    HistoryConsultationItem(
      id: '1',
      status: ConsultationStatus.pending,
      doctorName: 'Dr. Tesfaye Alemayehu',
      imagePath: 'assets/images/doctor.png',
      specialty: 'Cardiology',
      subSpecialty: 'Interventional Cardiology',
      experience: '10+ Years',
      qualification: 'MD, Specialty Certification',
      rating: 3.5,
    ),
    HistoryConsultationItem(
      id: '2',
      status: ConsultationStatus.rejected,
      doctorName: 'Dr. Helina Alemayehu',
      imagePath: 'assets/images/defence.png',
      specialty: 'Endocrinology',
      subSpecialty: 'Diabetes & Metabolic Disorders',
      experience: '8 Years',
      qualification: 'MD, Endocrinology Fellowship',
      rating: 4.0,
    ),
  ];

  List<HistoryConsultationItem> get filteredItems {
    if (selectedFilterIndex.value == 0) return _allItems;
    final status = selectedFilterIndex.value == 1
        ? ConsultationStatus.pending
        : ConsultationStatus.rejected;
    return _allItems.where((e) => e.status == status).toList();
  }

  void setFilter(int index) {
    selectedFilterIndex.value = index.clamp(0, 2);
  }
}
