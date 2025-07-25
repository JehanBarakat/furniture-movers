import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';

class ChatInputBar extends StatelessWidget {
  const ChatInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 0,
      ), // أو vertical: 8.h إذا التصميم يحتاج
      height: 48.h,
      color: AppColors.white,
      child: Row(
        children: [
          // زر الإرسال
          Container(
            width: 48.w,
            height: 48.w,
            decoration: const BoxDecoration(
              color: AppColors.primaryBlue,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.send_rounded,
              color: AppColors.white,
              size: 20.sp,
            ),
          ),

          SizedBox(width: 16.w),

          // حقل الكتابة
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.lightPrimaryGrey,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontFamily: 'Almarai',
                        fontSize: 14.sp,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                  Icon(Icons.add, color: AppColors.primaryBlue, size: 20.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
