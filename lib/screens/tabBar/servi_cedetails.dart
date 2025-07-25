import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetailsCard extends StatelessWidget {
  const ServiceDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header (مشاركة + مفضلة + نجمة)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ناقل أثاث',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text('4.5', style: TextStyle(fontSize: 18.sp)),

                    SizedBox(width: 16.w),
                    Icon(Icons.star, size: 20.sp, color: Colors.amber),
                    SizedBox(width: 16.w),
                    Icon(Icons.favorite_border, size: 26.sp, color: Colors.red),

                    SizedBox(width: 8.w),
                    Icon(Icons.share, size: 26.sp, color: Colors.black54),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),

            // السعر
            Text(
              '\$14.4',
              style: TextStyle(
                color: Color(0xFF2567F2),
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6.h),

            // اسم المقدم
            Text(
              'علي عبدالله سعيد',
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),

            // وصف الخدمة
            Text(
              'تقدم خدمة نقل الأثاث لدينا حلاً كاملاً وآمناً لنقل أثاثك بأمان وسهولة، مع تغليف احترافي، وفك وتركيب الأثاث ونقل الأثاث الثقيل. فريقنا المتخصص يضمن لك عملية نقل خالية من التوتر مع خدمات تخزين مؤقتة وأسعار تنافسية. اجعل انتقالك سهلاً معنا.',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 13.sp,
                height: 1.7,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 3.h),
            // قراءة المزيد
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Text(
                  'قراءة المزيد',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Color(0xFF2567F2),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),

            // Spacer
            SizedBox(height: 16.h),
            // زر طلب الخدمة
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4B75CB), Color(0xFF4999CB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                  ),
                  onPressed: () {},
                  child: Text(
                    'طلب الخدمة',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
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
