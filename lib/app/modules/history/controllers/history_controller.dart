import 'package:get/get.dart';
import 'package:dhmd/app/modules/home/views/widgets/consultation_history_section.dart';

class HistoryController extends GetxController {
  final items = const <ConsultationItem>[
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
    ConsultationItem(
      name: 'Dr. Samrawit Dejen',
      specialty: 'Specialist Cardiologist',
      rating: 4,
      imagePath: 'assets/images/person.png',
      isOnline: false,
      isFavorite: true,
    ),
    ConsultationItem(
      name: 'Helen Agez',
      specialty: 'Specialist Cardiologist',
      rating: 4,
      imagePath: 'assets/images/person.png',
      isOnline: false,
      isFavorite: true,
    ),
  ];
}
