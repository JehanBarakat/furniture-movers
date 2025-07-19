import 'package:flutter/material.dart';
import 'app_colors.dart'; // لاستيراد الألوان اللي عرفناها

class AppTextStyles {
  // عنوان رئيسي كبير
  static const TextStyle heading1 = TextStyle(
    fontFamily: 'Almarai',

    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  // عنوان ثانوي أو عنوان شريط
  static const TextStyle heading2 = TextStyle(
    fontFamily: 'Almarai',

    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  // نص الأزرار
  static const TextStyle buttonText = TextStyle(
    fontFamily: 'Almarai',

    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  // النص العادي داخل الصفحة
  static const TextStyle bodyText = TextStyle(
    fontFamily: 'Almarai',

    fontSize: 16,
    color: AppColors.darkGrey,
  );

  // نص صغير (ملاحظات أو توضيحات)
  static const TextStyle smallText = TextStyle(
    fontFamily: 'Almarai',

    fontSize: 14,
    color: AppColors.grey,
  );

  // نص زر تسجيل الخروج
  static const TextStyle logoutText = TextStyle(
    fontFamily: 'Almarai',

    fontSize: 16,
    color: AppColors.logoutRed,
    fontWeight: FontWeight.w500,
  );
}
