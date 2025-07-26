import 'package:flutter/material.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';

/// حوار تأكيد تسجيل الخروج (مطابق للصورة)
class LogoutConfirmDialog extends StatelessWidget {
  const LogoutConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // أيقونة الخروج داخل دائرة حمراء
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: AppColors.logoutRed,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.logout, color: AppColors.white, size: 40),
            ),
            const SizedBox(height: 16),
            // نص التأكيد
            const Text(
              'هل أنت متأكد أنك تريد تسجيل الخروج',
              style: TextStyle(
                fontFamily: 'Almarai',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            // زر موافق (نص أزرق فقط)
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'موافق',
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ),
            const Divider(height: 32, color: AppColors.lightPrimaryGrey),
            // زر رجوع (نص أسود فقط)
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'رجوع',
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
