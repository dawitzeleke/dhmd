import 'package:flutter/material.dart';

class AppointmentCancelDialog extends StatelessWidget {
  final VoidCallback onConfirmCancel;

  const AppointmentCancelDialog({super.key, required this.onConfirmCancel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        padding: const EdgeInsets.fromLTRB(22, 24, 22, 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 30,
              offset: Offset(0, 18),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xFFFF0040),
              child: Text(
                '!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Cancel Appointment',
              style: TextStyle(
                color: Color(0xFF1F2230),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Are you sure you want to cancel this\nappointment?',
                style: TextStyle(
                  color: Color(0xFF22252F),
                  fontSize: 14,
                  height: 1.45,
                ),
              ),
            ),
            const SizedBox(height: 26),
            SizedBox(
              width: 130,
              height: 44,
              child: ElevatedButton(
                onPressed: onConfirmCancel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0040),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
