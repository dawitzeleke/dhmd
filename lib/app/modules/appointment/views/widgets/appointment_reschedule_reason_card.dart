import 'package:flutter/material.dart';

class AppointmentRescheduleReasonCard extends StatelessWidget {
  final TextEditingController reasonController;
  final VoidCallback onNext;

  const AppointmentRescheduleReasonCard({
    super.key,
    required this.reasonController,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Provide your Reason for rescheduling',
          style: TextStyle(
            color: Color(0xFF2F3340),
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 18),
        Container(
          width: double.infinity,
          height: 122,
          decoration: BoxDecoration(
            color: const Color(0xFFD5D8DE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: reasonController,
            maxLines: null,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            style: const TextStyle(fontSize: 14, color: Color(0xFF2F3340)),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(12),
              hintText: '',
            ),
          ),
        ),
        const SizedBox(height: 78),
        Center(
          child: SizedBox(
            width: 126,
            height: 42,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1EB4E7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
