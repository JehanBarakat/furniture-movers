import '../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تواصل بنا',
        trailingIcon: const Icon(Icons.arrow_forward_ios),
        onTrailingPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildContactRow(
              context,
              text: '@amal',
              imagePath: 'assets/images/twiter.jpg',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _buildContactRow(
              context,
              text: '0020128473837477474',
              imagePath: 'assets/images/phone.jpg',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _buildContactRow(
              context,
              text: 'alamal@gmail.com',
              imagePath: 'assets/images/email.jpg',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(
      BuildContext context, {
        required String text,
        required String imagePath,
        required VoidCallback onTap,
        double imageWidth = 32,
        double imageHeight = 32,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Almarai',                   // الخط
                fontWeight: FontWeight.w700,              // وزن الخط Bold
                fontSize: 14,                             // حجم الخط 14px
                height: 24 / 14,                          // line-height 24px (1.71)
                letterSpacing: 0,                         // بدون تباعد
                decoration: TextDecoration.underline,    // خط تحت النص
                decorationStyle: TextDecorationStyle.solid, // نوع الخط تحت النص (صلب)
                decorationThickness: 1.5,                   // سماكة الخط تحت النص (0 = رفيع جدًا)
                decorationColor: AppColors.primaryBlue,  // لون الخط تحت النص
                color: AppColors.primaryBlue,             // لون النص
              ),
              textAlign: TextAlign.right,               // محاذاة النص يمين
              textDirection: TextDirection.ltr,         // اتجاه النص (عشان الأرقام أو الإنجليزي)
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            imagePath,
            width: imageWidth,
            height: imageHeight,
          ),
        ),
      ],
    );
  }
}
