import 'package:get/get.dart';

class ProfileController extends GetxController {
  final userName = 'Girma Tefera';
  final userEmail = 'girma@gmail.com';

  final isSettingsOpen = false.obs;
  final isAccountInfoOpen = false.obs;
  final textMessagesEnabled = true.obs;
  final phoneCallsEnabled = true.obs;
  final videoCallEnabled = true.obs;

  void openAccountInfo() {
    isAccountInfoOpen.value = true;
    isSettingsOpen.value = false;
  }

  void closeAccountInfo() => isAccountInfoOpen.value = false;

  void openSettings() {
    isSettingsOpen.value = true;
    isAccountInfoOpen.value = false;
  }

  void closeSettings() => isSettingsOpen.value = false;

  void setTextMessages(bool value) => textMessagesEnabled.value = value;

  void setPhoneCalls(bool value) => phoneCallsEnabled.value = value;

  void setVideoCall(bool value) => videoCallEnabled.value = value;
}
