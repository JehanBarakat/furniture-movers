import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import '../constants/app_colors.dart';

class CustomPhoneInput extends StatefulWidget {
  final Function(String fullNumber)? onChanged;

  const CustomPhoneInput({super.key, this.onChanged});

  @override
  State<CustomPhoneInput> createState() => _CustomPhoneInputState();
}

class _CustomPhoneInputState extends State<CustomPhoneInput> {
  Country _selectedCountry = CountryPickerUtils.getCountryByIsoCode('EG');
  final TextEditingController _controller = TextEditingController();

  void _openCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: CountryPickerDialog(
          titlePadding: EdgeInsets.all(8.0.w),
          searchCursorColor: AppColors.black,
          searchInputDecoration: const InputDecoration(hintText: 'بحث'),
          isSearchable: true,
          title: const Text('اختر الدولة'),
          onValuePicked: (Country country) {
            setState(() => _selectedCountry = country);
          },
          itemBuilder: _buildDialogItem,
        ),
      ),
    );
  }

  Widget _buildDialogItem(Country country) {
    return Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(width: 8.w),
        Text("(+${country.phoneCode})"),
        SizedBox(width: 8.w),
        Expanded(child: Text(country.name)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // ترتيب يسار ليمين
      child: Container(
        width: 380.w,
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w), // بدون padding عمودي
        decoration: BoxDecoration(
          color: AppColors.veryLightGrey,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1- العلم
            CountryPickerUtils.getDefaultFlagImage(_selectedCountry),
            SizedBox(width: 8.w),

            // 2- الرمز الدولي
            Text(
              "(+${_selectedCountry.phoneCode})",
              style: AppTextStyles.smallTextAr.copyWith(color: AppColors.primaryBlue),
            ),
            SizedBox(width: 12.w),

            // 3- حقل إدخال الرقم
            Expanded(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.phone,
                textDirection: TextDirection.ltr,
                textAlignVertical: TextAlignVertical.center, // توسيط عمودي
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '1012445665',
                  hintStyle: AppTextStyles.smallTextAr,
                  isDense: true, // يقلل الـ padding الداخلي
                  contentPadding: EdgeInsets.only(top: 6, bottom: 0), 
                ),
                onChanged: (_) {
                  final full = '+${_selectedCountry.phoneCode}${_controller.text}';
                  widget.onChanged?.call(full);
                },
              ),
            ),

            // 4- السهم
            IconButton(
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: _openCountryPickerDialog,
            ),
          ],
        ),
      ),
    );
  }
}
