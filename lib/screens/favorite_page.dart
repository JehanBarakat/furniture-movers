import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/screens/tabBar/service_details_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

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
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'المفضلة',
          style: AppTextStyles.heading2Ar.copyWith(
            fontSize: 20.sp,
            color: AppColors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Divider(height: 1.h, thickness: 1.h, color: AppColors.lightGrey),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                      textDirection: TextDirection.rtl,
                      children: [
                        // الصورة وخلفية القلب
                        Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.asset(
                                  fav['image'] as String,
                                  width: 120.w,
                                  height: 120.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8.h,
                                left: 8.w,
                                child: Container(
                                  width: 28.w,
                                  height: 28.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.favorite,
                                    color: AppColors.errorRed,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // البيانات والنص والزر
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 16.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  fav['name'] as String,
                                  textAlign: TextAlign.right,
                                  style: AppTextStyles.heading2Ar.copyWith(
                                    fontSize: 18.sp,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  fav['role'] as String,
                                  textAlign: TextAlign.right,
                                  style: AppTextStyles.smallTextAr.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.grey,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(5, (i) {
                                    return Icon(
                                      i < (fav['rating'] as int)
                                          ? Icons.star
                                          : Icons.star_border,
                                      size: 20.sp,
                                      color: AppColors.warningYellow,
                                    );
                                  }),
                                ),
                                SizedBox(height: 12.h),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 120.w,
                                    height: 36.h,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryBlue,
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
                                            .copyWith(fontSize: 14.sp),
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
    );
  }
}
