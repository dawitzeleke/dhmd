import 'package:get/get.dart';

class ProfileController extends GetxController {
  final userName = 'Girma Tefera';
  final userEmail = 'girma@gmail.com';

  final isSettingsOpen = false.obs;
  final textMessagesEnabled = true.obs;
  final phoneCallsEnabled = true.obs;
  final videoCallEnabled = true.obs;

  void openSettings() => isSettingsOpen.value = true;

  void closeSettings() => isSettingsOpen.value = false;

  void setTextMessages(bool value) => textMessagesEnabled.value = value;

  void setPhoneCalls(bool value) => phoneCallsEnabled.value = value;

  void setVideoCall(bool value) => videoCallEnabled.value = value;
}
