import 'dart:async';

import 'package:get/get.dart';

class OtpController extends GetxController {
  final secondsRemaining = 60.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _startTimer() {
    _timer?.cancel();
    secondsRemaining.value = 60;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value == 0) {
        timer.cancel();
      } else {
        secondsRemaining.value--;
      }
    });
  }

  void resendCode() {
    _startTimer();
  }

  String get timerText {
    final mm = (secondsRemaining.value ~/ 60).toString().padLeft(2, '0');
    final ss = (secondsRemaining.value % 60).toString().padLeft(2, '0');
    return '$mm:$ss';
  }
}
