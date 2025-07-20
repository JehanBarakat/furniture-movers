import 'package:flutter/material.dart';

class AppSpacing {
  // قيم ثابتة للتباعد والحشوة المستخدمة في التصميم لضمان الاتساق
  static const double screenHorizontalPadding = 20.0; // حشوة أفقية قياسية للشاشات
  static const double mediumVerticalSpacing = 16.0; // تباعد عمودي متوسط بين العناصر
  static const double largeVerticalSpacing = 24.0; // تباعد عمودي كبير
  static const double smallVerticalSpacing = 8.0; // تباعد عمودي صغير

  // حشوة قياسية يمكن استخدامها لمعظم الشاشات
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: screenHorizontalPadding,
    vertical: mediumVerticalSpacing,
  );
}
