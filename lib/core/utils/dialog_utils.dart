import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
// إذا بدك تدعم SVG أيقونات، ضيف import لـ flutter_svg وحطها بدل Icon

class DialogUtils {
  // دالة عامة لعرض مربع حوار مخصص
  static void showCustomDialog({
    required BuildContext context,
    required String title, // العنوان الرئيسي (إجباري)
    String? message, // نص فرعي أو شرح (اختياري)
    String confirmButtonText = "موافق", // نص زر التأكيد
    String? cancelButtonText, // نص زر الإلغاء (اختياري - إذا null يختفي)
    VoidCallback? onConfirm, // دالة عند ضغط "موافق"
    VoidCallback? onCancel, // دالة عند ضغط "رجوع" أو الإلغاء
    IconData? icon, // أيقونة Flutter عادية
    Widget? customIcon, // أو إذا بدك تمرر ويدجت (مثلاً SVG)
    Color iconBackgroundColor = AppColors.primaryBlue, // لون الدائرة
    bool barrierDismissible = false, // هل ممكن يغلق الحوار من الخلفية؟
    // === الأنماط الجديدة القابلة للتخصيص ===
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    TextStyle? confirmButtonStyle,
    TextStyle? cancelButtonStyle,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // الصندوق الأبيض الرئيسي
              Container(
                margin: const EdgeInsets.only(top: 44),
                padding: const EdgeInsets.fromLTRB(18, 58, 18, 18),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkGrey.withAlpha(
                        (0.08 * 255).toInt(),
                      ), // أقرب شي للون الظل حالياً
                      blurRadius: 20,
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
                      style: titleStyle ?? AppTextStyles.heading2Ar,
                      textAlign: TextAlign.center,
                    ),
                    if (message != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        message,
                        style: messageStyle ?? AppTextStyles.bodyTextAr,
                        textAlign: TextAlign.center,
                      ),
                    ],
                    const SizedBox(height: 28),
                    // الأزرار
                    Row(
                      children: [
                        if (cancelButtonText != null)
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                if (onCancel != null) onCancel();
                              },
                              child: Text(
                                cancelButtonText,
                                style:
                                    cancelButtonStyle ??
                                    AppTextStyles.bodyTextAr.copyWith(
                                      color: AppColors.darkGrey,
                                    ),
                              ),
                            ),
                          ),
                        if (cancelButtonText != null) const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              if (onConfirm != null) onConfirm();
                            },
                            child: Text(
                              confirmButtonText,
                              style:
                                  confirmButtonStyle ??
                                  AppTextStyles.buttonTextAr,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // الدائرة العلوية (أيقونة/شعار/تحذير)
              Positioned(
                top: 0,
                child: CircleAvatar(
                  backgroundColor: iconBackgroundColor,
                  radius: 44,
                  child:
                      customIcon ??
                      (icon != null
                          ? Icon(icon, color: AppColors.white, size: 44)
                          : const SizedBox()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
