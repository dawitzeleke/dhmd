import 'package:flutter/material.dart';


class AppColors {
  static const Color primary = Color.fromRGBO(20, 183, 232, 0.8);
  /// Solid primary (#14B7E8) for filled backgrounds.
  static const Color primarySolid = Color(0xFF14B7E8);
  static const Color onPrimary = Color.fromRGBO(255, 255, 255, 1);
  static const Color background = Color.fromRGBO(245, 247, 251, 1);

  /// History/consultation status
  static const Color pendingBg = Color(0xFFFFF8E1);
  static const Color pendingDot = Color(0xFF22C55E);
  static const Color rejectedBg = Color(0xFFFFE4EC);
  static const Color rejectedDot = Color(0xFFEF4444);

  /// Custom palette (#RRGGBBAA)
  static const Color goldTint = Color(0x80F6D060);
  static const Color redTint = Color(0x80FF0036);
}