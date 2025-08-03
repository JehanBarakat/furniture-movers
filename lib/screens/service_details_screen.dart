import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/screens/tabBar/service_details_page.dart';

// ✅ بيانات التعليقات
class EmployeeComment {
  final String comment;
  final int rating;
  final String createdAt;

  EmployeeComment({
    required this.comment,
    required this.rating,
    required this.createdAt,
  });

  factory EmployeeComment.fromJson(Map<String, dynamic> json) {
    return EmployeeComment(
      comment: json['comment'] ?? '',
      rating: json['rating'] ?? 0,
      createdAt: json['created_at'] ?? '',
    );
  }
}

// ✅ خدمة جلب البيانات
class ApiService {
  static const String _baseUrl =
      'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/employee_questions';

  static const Map<String, String> _headers = {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
    'apikey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
    'Accept': 'application/json',
  };

  static Future<List<EmployeeComment>> fetchComments(int employeeId) async {
    final url = Uri.parse("$_baseUrl?employee_id=eq.$employeeId");
    final res = await http.get(url, headers: _headers);

    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => EmployeeComment.fromJson(e)).toList();
    } else {
      throw Exception('فشل تحميل التعليقات');
    }
  }
}

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  static const List<Map<String, dynamic>> _favorites = [
    {
      'id': 1,
      'name': 'محمد حسن أحمد',
      'role': 'مهندس كهربائي',
      'rating': 5,
      'image': 'assets/images/40d4e5e21bde813f700606f55f2b5f772e729131.jpg',
    },
    {
      'id': 2,
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
                  final employeeId = fav['id'] as int;
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
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.asset(
                                    fav['image'],
                                    width: 80.w,
                                    height: 80.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(fav['name'], style: AppTextStyles.heading2Ar),
                                      Text(fav['role'], style: AppTextStyles.smallTextAr),
                                      Row(
                                        children: List.generate(5, (i) {
                                          return Icon(
                                            i < fav['rating'] ? Icons.star : Icons.star_border,
                                            color: AppColors.warningYellow,
                                            size: 18.sp,
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const ServiceDetailsPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue,
                                foregroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: Text(
                                'احجز الآن',
                                style: AppTextStyles.buttonTextAr.copyWith(fontSize: 13.sp),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            FutureBuilder<List<EmployeeComment>>(
                              future: ApiService.fetchComments(employeeId),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return SizedBox.shrink(); // حذف مؤشر التحميل
                                }
                                if (snapshot.hasError) {
                                  return Text('حدث خطأ أثناء تحميل التعليقات');
                                }

                                final comments = snapshot.data!;
                                if (comments.isEmpty) {
                                  return Text('لا توجد تعليقات بعد.');
                                }

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: comments.map((c) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: 4.h),
                                      child: Text("⭐ ${c.rating} - ${c.comment}"),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ],
                        ),
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
