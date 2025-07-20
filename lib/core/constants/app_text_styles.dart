import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // ----------------- Almarai (العربية) -----------------

  static const TextStyle heading1Ar = TextStyle(
    fontFamily: 'Almarai',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  
  // -----
  static const TextStyle heading2Ar = TextStyle(
    fontFamily: 'Almarai',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle buttonTextAr = TextStyle(
    fontFamily: 'Almarai',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle bodyTextAr = TextStyle(
    fontFamily: 'Almarai',
    fontSize: 16,
    color: AppColors.darkGrey,
  );

  static const TextStyle smallTextAr = TextStyle(
    fontFamily: 'Almarai',
    fontSize: 14,
    color: AppColors.grey,
  );

  static const TextStyle logoutTextAr = TextStyle(
    fontFamily: 'Almarai',
    fontSize: 16,
    color: AppColors.logoutRed,
    fontWeight: FontWeight.w500,
  );

  // ----------------- Poppins (الإنجليزية) -----------------

  static const TextStyle heading1En = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle heading2En = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle buttonTextEn = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle bodyTextEn = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    color: AppColors.darkGrey,
  );

  static const TextStyle smallTextEn = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    color: AppColors.grey,
  );

  static const TextStyle logoutTextEn = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    color: AppColors.logoutRed,
    fontWeight: FontWeight.w500,
  );
}
