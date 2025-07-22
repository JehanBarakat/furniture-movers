import 'package:flutter/material.dart';
import 'package:furnituremovers/core/widgets/custom_phone_field.dart';
import 'package:furnituremovers/core/widgets/custom_text_field.dart';
import 'package:furnituremovers/core/widgets/otp_input_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture Movers',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // ✅ يجعل خلفية كل الشاشات بيضاء
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      home: Test(), 
    ); 
  }
}

class Test extends StatelessWidget {
  Test({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPdController = TextEditingController();
  final TextEditingController askQuestion = TextEditingController();
  final TextEditingController comment = TextEditingController();
  final TextEditingController search = TextEditingController();
  final GlobalKey<OTPInputFieldState> _otpKey = GlobalKey<OTPInputFieldState>();
  //تستدعي getCurrentCode() من الكلاس OTPInputField
  //وبتجمع كل الأرقام اللي دخلها المستخدم بالخانات
  // void _checkOTP() {
  //   final otpCode = _otpKey.currentState?.getCurrentCode() ?? '';
  //   //print('رمز التحقق المدخل هو: $otpCode');

  //   // هون فيك تضيف منطق التحقق أو إرسال الرمز للسيرفر
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('واجهة بسيطة'), centerTitle: true),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //حقل الاسم
            CustomTextField(
              hintText: 'الاسم الكامل',
              controller: nameController,
              prefixIcon: Icon(Icons.person_2_outlined),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'الرجاء إدخال الاسم الكامل';
                }
                if (value.trim().length < 3) {
                  return 'الاسم يجب أن يكون على الأقل 3 أحرف';
                }
                return null; // لا يوجد خطأ
              },
            ),
            SizedBox(height: 10),

            //حقل كلمة المرور
            CustomTextField(
              hintText: '*****************',
              controller: passwordController,
              obscureText: true,
              prefixIcon: Icon(Icons.lock_open),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'الرجاء إدخال كلمة المرور  ';
                }
                if (value.trim().length < 8) {
                  return 'كلمة المرور يجب أن يكون على الأقل 8 أحرف';
                }
                return null; // لا يوجد خطأ
              },
            ),
            SizedBox(height: 10),

            //حقل تأكيد كلمة المرور
            CustomTextField(
              hintText: '*****************',
              controller: confirmPdController,
              obscureText: true,
              prefixIcon: Icon(Icons.lock_open),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'الرجاء إدخال كلمة المرور  ';
                }
                if (confirmPdController != passwordController) {
                  return 'كلمة المرور غير متطابقة';
                }
                if (value.trim().length < 8) {
                  return 'كلمة المرور يجب أن يكون على الأقل 8 أحرف';
                }

                return null; // لا يوجد خطأ
              },
            ),
            SizedBox(height: 10),

            //حقل طرح سؤال
            CustomTextField(
              hintText: 'طرح سؤال',
              controller: askQuestion,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'الرجاء كتابة السؤال';
                }
                return null;
              },
              width: 340,
              height: 42,
            ),
            SizedBox(height: 10),

            //حقل  إضافة تعليق
            CustomTextField(
              hintText: 'اكتب تعليق',
              controller: comment,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'الرجاء كتابة التعليق';
                }
                return null;
              },
              width: 372,
              height: 107,
            ),
            SizedBox(height: 10),

            //حقل  البحث
            CustomTextField(
              hintText: 'ابحث عن خدمة أو فنيٍّ',
              controller: search,
              prefixIcon: Icon(Icons.search),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'الرجاء كتابة التعليق';
                }
                return null;
              },
              width: 324,
            ),
            SizedBox(height: 10),
            

            //حقل  إرسال رسالة
            CustomTextField(
              hintText: 'اكتب',
              controller: search,
              prefixIcon: Icon(Icons.add),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'لا يمكن إرسال رسالة فارغة';
                }
                return null;
              },
              width: 317.17,
            ),
            SizedBox(height: 10),


            //حقل ادخال الرقم
           CustomPhoneInput(
              onChanged: (fullNumber) {
                //print('رقم الهاتف الكامل: $fullNumber');
                // فيك تخزنيه أو تبعتيه للسيرفر
              },
            ),
            SizedBox(height: 10),


            // عنصر OTP
            OTPInputField(
              key: _otpKey,
              length: 6, // عدد خانات OTP
            ),
          ],
        ),
      ),
    );
  }
}

