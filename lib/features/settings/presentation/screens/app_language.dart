import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/constants/app_colors.dart'; // استدعاء ملف الألوان

class AppLanguageScreen extends StatefulWidget {
  const AppLanguageScreen({Key? key}) : super(key: key);

  @override
  State<AppLanguageScreen> createState() => _AppLanguageScreenState();
}

class _AppLanguageScreenState extends State<AppLanguageScreen> {
  String _selectedLang = 'ar';

  final Country usCountry = CountryPickerUtils.getCountryByIsoCode('US');
  final Country arCountry = CountryPickerUtils.getCountryByIsoCode(
    'EG',
  ); // أو 'EG' لمصر

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'لغة التطبيق', onTrailingPressed: () {}),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildLangOption(
              value: 'en',
              label: 'English',
              flag: CountryPickerUtils.getDefaultFlagImage(usCountry),
            ),
            _buildLangOption(
              value: 'ar',
              label: 'عربي',
              flag: CountryPickerUtils.getDefaultFlagImage(arCountry),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLangOption({
    required String value,
    required String label,
    required Widget flag,
  }) {
    return Container(
      width: 380,
      height: 48,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: _selectedLang == value
              ? AppColors.primaryBlue
              : Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: _selectedLang,
              activeColor: AppColors.primaryBlue,
              onChanged: (val) {
                setState(() {
                  _selectedLang = val!;
                });
              },
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
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
                  const SizedBox(width: 12),
                  flag,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
