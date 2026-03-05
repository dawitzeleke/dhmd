import 'package:flutter/material.dart';

class BookingSectionTitle extends StatelessWidget {
  final String text;

  const BookingSectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black
      ),
    );
  }
}
