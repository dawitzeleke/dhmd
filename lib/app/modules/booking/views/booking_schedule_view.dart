import 'package:dhmd/app/components/app_button.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import 'widgets/booking_circle_choice.dart';
import 'widgets/booking_completed_card.dart';
import 'widgets/booking_top_bar.dart';

class BookingScheduleView extends GetView<BookingController> {
  const BookingScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    final timeSlots = const [
      ('10:00', 'AM'),
      ('12:00', 'AM'),
      ('02:00', 'PM'),
      ('03:00', 'PM'),
      ('04:00', 'PM'),
    ];

    final reminders = const [
      ('30', 'Minit'),
      ('40', 'Minit'),
      ('25', 'Minit'),
      ('10', 'Minit'),
      ('35', 'Minit'),
    ];

    final days = const [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '30',
      '31',
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 28),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 26),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BookingTopBar(title: 'Reschedule Appointments'),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.chevron_left, size: 20),
                                Spacer(),
                                Text(
                                  'Feb 2026',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1E2B3C),
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.chevron_right, size: 20),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                10,
                                10,
                                10,
                                12,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7F9FC),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      _WeekText('Mo'),
                                      _WeekText('Tu'),
                                      _WeekText('We'),
                                      _WeekText('Th'),
                                      _WeekText('Fr'),
                                      _WeekText('Sa'),
                                      _WeekText('Su'),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: days.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 7,
                                          childAspectRatio: 1.1,
                                        ),
                                    itemBuilder: (context, index) {
                                      final day = days[index];
                                      final isSelected = day == '15';
                                      final faded = [
                                        '4',
                                        '6',
                                        '10',
                                        '11',
                                        '12',
                                        '14',
                                        '17',
                                        '18',
                                        '19',
                                        '20',
                                        '21',
                                        '22',
                                        '25',
                                        '28',
                                        '29',
                                        '31',
                                      ].contains(day);

                                      return Center(
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? AppColors.primary
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: Text(
                                            day,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: isSelected
                                                  ? Colors.white
                                                  : faded
                                                  ? const Color(0xFFC7CAD0)
                                                  : const Color(0xFF4D4F55),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 110),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(14, 24, 14, 18),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Time Slots',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(timeSlots.length, (
                                index,
                              ) {
                                final slot = timeSlots[index];
                                return BookingCircleChoice(
                                  topText: slot.$1,
                                  bottomText: slot.$2,
                                  selected:
                                      controller.selectedTimeSlotIndex.value ==
                                      index,
                                  onTap: () => controller.selectTimeSlot(index),
                                );
                              }),
                            ),
                            const SizedBox(height: 22),
                            const Text(
                              'Reminder Me Before',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(reminders.length, (
                                index,
                              ) {
                                final item = reminders[index];
                                return BookingCircleChoice(
                                  topText: item.$1,
                                  bottomText: item.$2,
                                  selected:
                                      controller.selectedReminderIndex.value ==
                                      index,
                                  onTap: () => controller.selectReminder(index),
                                );
                              }),
                            ),
                            const SizedBox(height: 28),
                            Center(
                              child: AppButton(
                                text: 'Done',
                                onPressed: controller.onScheduleDonePressed,
                                textSize: 14,
                                width: 170,
                                height: 44,
                                borderRadius: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (controller.showCompletedDialog.value)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.55),
                    alignment: Alignment.center,
                    child: BookingCompletedCard(
                      onDone: controller.closeCompletedDialog,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeekText extends StatelessWidget {
  final String text;

  const _WeekText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1E2026),
      ),
    );
  }
}
