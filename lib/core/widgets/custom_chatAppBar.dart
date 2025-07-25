import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';

class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomChatAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(85.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      toolbarHeight: 72.h,
      title: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back icon
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  // color: AppColors.lightPrimaryGrey,
                  color: AppColors.white,
                  border: Border.all(color: AppColors.lightGrey, width: 1.5),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5.w,
                    ), // عدّل القيمة حسب الحاجة
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20.sp,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
              ),
            ),

            // User info
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'محمد علي',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'متصل',
                      style: TextStyle(fontSize: 16.sp, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(width: 12.w),
                CircleAvatar(
                  radius: 24.r,
                  backgroundImage: AssetImage('assets/images/sticker.webp'),
                ),
              ],
            ),
          ],
        ),
      ),
      flexibleSpace: Column(
        children: [
          // Padding(padding: EdgeInsets.symmetric(horizontal: 50.w)),
          SizedBox(height: 105.h),
          Container(width: 1.sw, height: 1.h, color: AppColors.lightGrey),

          // Divider(height: 1.h, thickness: 1.5.h, color: AppColors.lightGrey),
        ],
      ),
    );
  }
}
