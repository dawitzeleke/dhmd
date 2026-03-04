import 'package:flutter/material.dart';

class BookingInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffix;
  final bool readOnly;
  final TextInputType keyboardType;

  const BookingInputField({
    super.key,
    this.controller,
    required this.hintText,
    this.suffix,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontSize: 17,
          color: Color(0xFF2F2F2F),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 17,
            color: Color(0xFFB6BAC3),
          ),
          suffixIcon: suffix,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE2E6ED)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE2E6ED)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFC8D3E2)),
          ),
        ),
      ),
    );
  }
}
