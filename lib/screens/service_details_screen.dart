import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/screens/tabBar/service_details_page.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  static const List<Map<String, dynamic>> _favorites = [
    {
      'name': 'محمد حسن أحمد',
      'role': 'مهندس كهربائي',
      'rating': 5,
      'image': 'assets/images/40d4e5e21bde813f700606f55f2b5f772e729131.jpg',
    },
    {
      'name': 'علي عبدالله سعيد',
      'role': 'ناقل أثاث',
      'rating': 5,
      'image': 'assets/images/40d4e5e21bde813f700606f55f2b5f772e729131.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.black),
          title: Text(
            'نقل الأثاث',
            style: AppTextStyles.heading2Ar.copyWith(
              fontSize: 20.sp,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Divider(height: 1.h, thickness: 1.h, color: AppColors.lightGrey),

            /// ✅ صورة الخدمة
            Padding(
              padding: EdgeInsets.all(16.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  'assets/images/Furniture moving.png',
                  width: double.infinity,
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// ✅ عنوان القسم
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الفنيون الموجودون في الخدمة',
                  style: AppTextStyles.heading2Ar.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12.h),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                itemCount: _favorites.length,
                itemBuilder: (context, index) {
                  final fav = _favorites[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ServiceDetailsPage(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        color: AppColors.lightPrimaryGrey,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.w),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.asset(
                                    fav['image'] as String,
                                    width: 80.w,
                                    height: 80.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 4.h,
                                  left: 50.w,
                                  child: Container(
                                    width: 24.w,
                                    height: 24.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.favorite,
                                      color: AppColors.errorRed,
                                      size: 16.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // ✅ معلومات الفني وزر الحجز والتقييم
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 16.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fav['name'] as String,
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.heading2Ar.copyWith(
                                      fontSize: 16.sp,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    fav['role'] as String,
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.smallTextAr.copyWith(
                                      fontSize: 13.sp,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(5, (i) {
                                      return Icon(
                                        i < (fav['rating'] as int)
                                            ? Icons.star
                                            : Icons.star_border,
                                        size: 18.sp,
                                        color: AppColors.warningYellow,
                                      );
                                    }),
                                  ),
                                  SizedBox(height: 10.h),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      width: 200.w,
                                      height: 32.h,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primaryBlue,
                                          foregroundColor: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8.r,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  const ServiceDetailsPage(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'احجز الآن',
                                          style: AppTextStyles.buttonTextAr
                                              .copyWith(fontSize: 13.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
