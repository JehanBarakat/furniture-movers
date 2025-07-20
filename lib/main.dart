// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Furniture Movers',
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:furnituremovers/core/constants/app_spacing.dart'; // استيراد ثوابت التباعد من مهمة الشخص 6
 // استيراد الألوان من مهمة الشخص 1
import 'package:flutter_svg/flutter_svg.dart'; // استيراد حزمة flutter_svg لعرض أيقونات SVG (من إعداد الشخص 6)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'اختبار التباعد والأصول',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SpacingAndAssetsTestScreen(), // شاشة الاختبار المحدثة
    );
  }
}

class SpacingAndAssetsTestScreen extends StatelessWidget {
  const SpacingAndAssetsTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختبار AppSpacing والأصول'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView( // استخدام SingleChildScrollView للسماح بالتمرير إذا كان المحتوى كبيرًا
        padding: AppSpacing.screenPadding, // استخدام حشوة الشاشة القياسية من AppSpacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر إلى اليسار
          children: [
            Text(
              'أمثلة على استخدام AppSpacing:',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), // استخدام TextStyle مباشر
            ),
            const SizedBox(height: AppSpacing.largeVerticalSpacing), // تباعد كبير

            // مثال 1: استخدام تباعد عمودي متوسط
            Container(
              color: Colors.lightBlue[100],
              padding: const EdgeInsets.all(AppSpacing.mediumVerticalSpacing), // استخدام قيمة تباعد من AppSpacing
              child: const Text(
                'هذا النص داخل حاوية بحشوة متوسطة (AppSpacing.mediumVerticalSpacing).',
                style: TextStyle(fontSize: 16, color: Colors.black87), // استخدام TextStyle مباشر
              ),
            ),
            const SizedBox(height: AppSpacing.mediumVerticalSpacing), // تباعد متوسط

            // مثال 2: استخدام تباعد عمودي صغير
            Container(
              color: Colors.green[100],
              padding: const EdgeInsets.all(AppSpacing.smallVerticalSpacing), // استخدام قيمة تباعد من AppSpacing
              child: const Text(
                'هذا النص داخل حاوية بحشوة صغيرة (AppSpacing.smallVerticalSpacing).',
                style: TextStyle(fontSize: 16, color: Colors.black87), // استخدام TextStyle مباشر
              ),
            ),
            const SizedBox(height: AppSpacing.largeVerticalSpacing), // تباعد كبير

            // مثال 3: استخدام SizedBox للتباعد بين العناصر
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.orange,
                  child: const Center(child: Text('عنصر 1', style: TextStyle(color: Colors.white))),
                ),
                const SizedBox(width: AppSpacing.screenHorizontalPadding), // تباعد أفقي من AppSpacing
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.purple,
                  child: const Center(child: Text('عنصر 2', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.largeVerticalSpacing), // تباعد كبير

            // مثال 4: استخدام AppSpacing.screenPadding لحشوة خارجية
            Container(
              color: Colors.red[100],
              // هنا نستخدم AppSpacing.screenPadding مباشرة كـ EdgeInsets
              padding: AppSpacing.screenPadding,
              child: const Text(
                'هذه الحاوية تستخدم AppSpacing.screenPadding كحشوة شاملة. لاحظ المسافات من جميع الجوانب.',
                style: TextStyle(fontSize: 16, color: Colors.black87), // استخدام TextStyle مباشر
              ),
            ),
            const SizedBox(height: AppSpacing.largeVerticalSpacing), // تباعد كبير

            // -----------------------------------------------------------
            // أمثلة على اختبار وجود الصورة والأيقونة (من مهمة الشخص 6)
            // -----------------------------------------------------------

            Text(
              'أمثلة على استخدام الأصول (الصور والأيقونات):',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), // استخدام TextStyle مباشر
            ),
            const SizedBox(height: AppSpacing.mediumVerticalSpacing), // تباعد متوسط

            // اختبار وجود صورة (يجب أن يكون لديك ملف assets/images/logo.png)
            Center(
              child: Image.asset(
                'assets/images/Profile picture.jpg', // مسار صورة افتراضي
                width: 150,
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('خطأ: لم يتم العثور على الصورة (logo.png). تأكد من وجودها في assets/images/ وتحديث pubspec.yaml.');
                },
              ),
            ),
            const SizedBox(height: AppSpacing.largeVerticalSpacing), // تباعد كبير

            // اختبار وجود أيقونة SVG (يجب أن يكون لديك ملف assets/icons/home_outline.svg)
            Center(
              child: SvgPicture.asset(
                'assets/icons/Home.svg', // مسار أيقونة SVG افتراضي
                width: 50,
                height: 50,
                colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn), // تلوين الأيقونة باستخدام لون مباشر
                placeholderBuilder: (context) => const CircularProgressIndicator(), // مؤشر تحميل اختياري
                // يمكنك إضافة errorBuilder هنا أيضًا إذا لزم الأمر
              ),
            ),
            const SizedBox(height: AppSpacing.largeVerticalSpacing), // تباعد كبير

            const Text( // استخدام TextStyle مباشر
              'إذا ظهرت الصورة والأيقونة أعلاه بشكل صحيح، فهذا يعني أن إعدادات الأصول (assets) في pubspec.yaml صحيحة وأن الملفات موجودة في المسارات المحددة.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}