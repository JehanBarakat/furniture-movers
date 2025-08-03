import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Employee {
  final int id;
  final String name;
  final String jobTitle;
  final double rating;
  final String imageUrl;
  final double price;
  final String description;

  Employee({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.rating,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      jobTitle: json['job_title'],
      rating: (json['rating'] ?? 0.0).toDouble(),
      imageUrl: json['image_url'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      description: json['description'] ?? '',
    );
  }
}


class ServiceDetailsCard extends StatefulWidget {
  final int employeeId;


  const ServiceDetailsCard({super.key, required this.employeeId});

  @override
  State<ServiceDetailsCard> createState() => _ServiceDetailsCardState();
}

class _ServiceDetailsCardState extends State<ServiceDetailsCard> {

  late Future<Employee> _employeeFuture;

  @override
  void initState() {
    super.initState();
    _employeeFuture = fetchEmployee(widget.employeeId);
  }

  Future<Employee> fetchEmployee(int employeeId) async {
    final response = await http.get(
      Uri.parse(
        'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/employees?id=eq.$employeeId',
      ),
      headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
        'apikey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.isNotEmpty) {
        return Employee.fromJson(data[0]);
      } else {
        throw Exception('No employee found');
      }
    } else {
      throw Exception('Failed to load employee');
    }
  }




  
@override
  Widget build(BuildContext context) {
    return FutureBuilder<Employee>(
      future: _employeeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('حدث خطأ في جلب البيانات'));
        }

        final employee = snapshot.data!;

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
                      employee.jobTitle,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          employee.rating.toStringAsFixed(1),
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        SizedBox(width: 16.w),
                        Icon(Icons.star, size: 20.sp, color: Colors.amber),
                        SizedBox(width: 16.w),
                        Icon(Icons.favorite_border,
                            size: 26.sp, color: Colors.red),
                        SizedBox(width: 8.w),
                        Icon(Icons.share, size: 26.sp, color: Colors.black54),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

                // السعر
                Text(
                  '\$${employee.price} ',
                  style: TextStyle(
                    color: Color(0xFF2567F2),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.h),

                // اسم المقدم
                Text(
                  employee.name,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),

                // وصف الخدمة
                Text(
                  employee.description,
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
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: TextButton(
                //     onPressed: () {},
                //     style: TextButton.styleFrom(padding: EdgeInsets.zero),
                //     child: Text(
                //       'قراءة المزيد',
                //       style: TextStyle(
                //         fontSize: 13.sp,
                //         color: Color(0xFF2567F2),
                //         decoration: TextDecoration.underline,
                //       ),
                //     ),
                //   ),
                // ),

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
      },
    );
  }
}