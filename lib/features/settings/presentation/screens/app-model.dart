// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/constants/app_colors.dart';

class AppModeScreen extends StatefulWidget {
  const AppModeScreen({super.key});

  @override
  State<AppModeScreen> createState() => _AppModeScreenState();
}

class _AppModeScreenState extends State<AppModeScreen> {
  String _mode = 'light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'مود التطبيق',
        trailingIcon: const Icon(Icons.arrow_forward_ios),
        onTrailingPressed: () {
          // حدث الضغط على الأيقونة
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildModeOption(
              value: 'dark',
              label: 'الوضع المظلم',
              assetPath: 'assets/icons/Moon.svg',
            ),
            const SizedBox(height: 16),
            _buildModeOption(
              value: 'light',
              label: 'الوضع الفاتح',
              assetPath: 'assets/icons/Sun.svg',
            ),
            const SizedBox(height: 32),
            // عناصر إضافية
          ],
        ),
      ),
    );
  }

  Widget _buildModeOption({
    required String value,
    required String label,
    required String assetPath,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _mode == value ? AppColors.primaryBlue : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Radio<String>(
          value: value,
          groupValue: _mode,
          onChanged: (val) {
            setState(() {
              _mode = val!;
            });
          },
          activeColor: AppColors.primaryBlue,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 12,
                height: 1.0,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              assetPath,
              width: 24,
              height: 24,
              // ignore: deprecated_member_use
              color: AppColors.primaryBlue, // هنا لون ثابت
            ),
          ],
        ),
        onTap: () {
          setState(() {
            _mode = value;
          });
        },
      ),
    );
  }
}
