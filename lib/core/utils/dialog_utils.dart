import 'package:flutter/material.dart';

class DialogUtils {
  // دالة عرض مربع حوار مخصص حسب تعليمات المشروع
  static void showAlertDialog({
    required BuildContext context,
    required String title,
    required String message,
    String confirmButtonText = 'موافق',
    String? cancelButtonText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    IconData? icon, // أيقونة اختيارية (نجاح/تحذير)
    Color? iconColor, // لون الأيقونة إذا حابب تغيّره
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // الصندوق الأبيض
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.12 * 255).toInt()),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // العنوان
                    Text(
                      title,
                      // style: AppTextStyles.heading2,
                      // textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    // نص الرسالة
                    Text(
                      message,
                      // style: AppTextStyles.bodyText.copyWith(
                      //   color: AppColors.darkGrey,
                    ),

                    // textAlign: TextAlign.center,
                    const SizedBox(height: 24),
                    // الأزرار
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (cancelButtonText != null)
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                onCancel?.call();
                              },
                              child: Text(
                                cancelButtonText,
                                // style: AppTextStyles.buttonText.copyWith(
                                //   color: AppColors.primaryBlue,
                              ),
                            ),
                          ),
                        // ),
                        if (cancelButtonText != null) const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              onConfirm?.call();
                            },
                            style: ElevatedButton.styleFrom(
                              // backgroundColor: Colo.primaryBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              confirmButtonText,
                              // style: AppTextStyles.buttonText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // دائرة الأيقونة بالأعلى (إذا طلبت أيقونة)
              if (icon != null)
                Positioned(
                  top: 0,
                  child: CircleAvatar(
                    // backgroundColor: iconColor ?? AppColors.successGreen,
                    radius: 40,
                    child: Icon(icon, color: Colors.white, size: 48),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
