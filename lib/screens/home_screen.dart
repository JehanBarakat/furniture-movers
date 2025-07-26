// lib/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/screens/service_details_screen.dart';
import 'package:furnituremovers/screens/tabBar/service_details_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
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
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Stack(
          children: [
            Icon(Icons.notifications_outlined, color: Colors.black54, size: 30),
            Positioned(
              right: 3,
              top: 2,
              child: Container(
                width: 10.r,
                height: 10.r,
                decoration: BoxDecoration(
                  color: AppColors.successGreen,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        onPressed: () {},
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'مرحباً، محمد حسن',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              SizedBox(width: 4.w),
              Icon(Icons.arrow_drop_down, color: Colors.black54, size: 26),
              Text(
                'الإسكندرية، مصر',
                style: TextStyle(color: Colors.black54, fontSize: 14.sp),
              ),
              Icon(Icons.location_on_outlined, color: Colors.black54, size: 16),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?u=a042581f4e29026704d',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          // زر الفلتر بالصورة
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: IconButton(
              icon: Image.asset(
                'assets/icons/filters-2.png',
                width: 24.w,
                height: 24.w,
              ),
              onPressed: () {},
            ),
          ),

          SizedBox(width: 12.w),

          // حقل البحث
          Expanded(
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.lightGrey, width: 1.w),
              ),
              child: TextField(
                style: TextStyle(color: Colors.black87, fontSize: 14.sp),
                decoration: InputDecoration(
                  hintText: 'ابحث عن خدمة أو فني',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 100.w,
                    vertical: 7,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[600],
                    size: 24.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // عنوان القسم مع محاذاة داخلية
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  // عروض خاصة أفقي
  Widget _buildSpecialOffersSection() {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, idx) {
          return Container(
            margin: EdgeInsets.only(left: idx == 0 ? 0 : 16.w),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              elevation: 2,
              shadowColor: Colors.black12,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      'assets/images/4017ff5f0a1566401422f973dfc81b69b840800c.png',
                      width: 280.w,
                      height: 150.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainServicesSection(BuildContext context) {
    final services = <Map<String, dynamic>>[
      {
        'name': 'نقل الأثاث',
        'asset': 'assets/images/39bcb9c17aaab5118016c14c1f041c1653285880.png',
        'borderColor': AppColors.primaryBlue,
      },
      {
        'name': 'صيانة الأجهزة المنزلية',
        'asset': 'assets/images/e1aad62b8be687af2487338c49772e00cd8f5473.png',
        'borderColor': AppColors.primaryBlue,
      },
      {
        'name': 'الدهان والتشطيبات',
        'asset': 'assets/images/ba860d715fafcd1934d3310cd4a026223981e160.png',
        'borderColor': AppColors.primaryBlue,
      },
      {
        'name': 'الأعمال الكهربائية',
        'asset': 'assets/images/8af6373f1866f941148b6750ba961e95789a49b9.png',
        'borderColor': AppColors.primaryBlue,
      },
    ];

    // يقللنا قطر الدائرة شوية عشان نجنب overflow:
    final double circleDiameter = 75.w;
    // مسافة عمودية بين الصورة والنص
    final double verticalSpacing = 6.h;

    return SizedBox(
      height: 140.h, // نفس القيمة الأصلية
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        padding: EdgeInsets.only(left: 55.w),
        itemCount: services.length,
        itemBuilder: (context, idx) {
          final service = services.reversed.toList()[idx];

          final label = service['name'] as String;
          final asset = service['asset'] as String;
          final borderColor = service['borderColor'] as Color;

          return Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (label == 'نقل الأثاث') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ServiceDetailsScreen(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: circleDiameter,
                    height: circleDiameter,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: borderColor, width: 2.w),
                      image: DecorationImage(
                        image: AssetImage(asset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: verticalSpacing),

                SizedBox(
                  width: circleDiameter,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.smallTextAr.copyWith(fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'المميزون اليوم',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16.h),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // منع التمرير الداخلي
            padding: EdgeInsets.only(top: 12.h),
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
                              left: 85.w,
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 16.h),
            _buildSearchSection(),
            SizedBox(height: 24.h),
            _buildSectionTitle('العروض الخاصة'),
            SizedBox(height: 16.h),
            _buildSpecialOffersSection(),
            SizedBox(height: 24.h),
            _buildSectionTitle('الخدمات الرئيسية'),
            SizedBox(height: 16.h),
            _buildMainServicesSection(context),
            SizedBox(height: 24.h),
            _buildFeaturedSection(),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
