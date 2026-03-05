import 'package:get/get.dart';

import '../modules/booking/bindings/booking_binding.dart';
import '../modules/booking/views/booking_allergy_view.dart';
import '../modules/booking/views/booking_appointment_type_view.dart';
import '../modules/booking/views/booking_problem_view.dart';
import '../modules/booking/views/booking_schedule_view.dart';
import '../modules/booking/views/booking_treatment_view.dart';
import '../modules/booking/views/booking_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main_nav/bindings/main_nav_binding.dart';
import '../modules/main_nav/views/main_nav_view.dart';
import '../modules/new_password/bindings/new_password_binding.dart';
import '../modules/new_password/views/new_password_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/password_reset/bindings/password_reset_binding.dart';
import '../modules/password_reset/views/password_reset_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/success/bindings/success_binding.dart';
import '../modules/success/views/success_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_RESET,
      page: () => const PasswordResetView(),
      binding: PasswordResetBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => const NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS,
      page: () => const SuccessView(),
      binding: SuccessBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_NAV,
      page: () => const MainNavView(),
      binding: MainNavBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING,
      page: () => const BookingView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_PROBLEM,
      page: () => const BookingProblemView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_TREATMENT,
      page: () => const BookingTreatmentView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_ALLERGY,
      page: () => const BookingAllergyView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_APPOINTMENT_TYPE,
      page: () => const BookingAppointmentTypeView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_SCHEDULE,
      page: () => const BookingScheduleView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
  ];
}
