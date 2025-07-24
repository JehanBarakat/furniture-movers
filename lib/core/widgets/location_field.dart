import 'package:flutter/material.dart';
import 'package:csc_picker_plus/csc_picker_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';

class LocationDropdownField extends StatefulWidget {
  const LocationDropdownField({super.key});

  @override
  LocationDropdownFieldState createState() => LocationDropdownFieldState();
}

class LocationDropdownFieldState extends State<LocationDropdownField> {
  String? countryValue;
  String? stateValue;

  void _showLocationSelector(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    // مؤقت لتخزين الاختيارات داخل الـ BottomSheet
    String? tempCountry = countryValue;
    String? tempState = stateValue;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 16.h,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 16.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CSCPickerPlus(
                  showCities: false,
                  showStates: true,
                  flagState: CountryFlag.DISABLE,

                  countryStateLanguage: isArabic
                      ? CountryStateLanguage.arabic
                      : CountryStateLanguage.englishOrNative,

                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.grey),
                  ),

                  countrySearchPlaceholder:
                      isArabic ? 'ابحث عن دولة' : 'Search Country',
                  stateSearchPlaceholder:
                      isArabic ? 'ابحث عن محافظة' : 'Search State',

                  onCountryChanged: (country) {
                    tempCountry = country;
                    tempState = null;
                    setState(() {});
                  },

                  onStateChanged: (state) {
                    tempState = state;
                    setState(() {});
                  },

                  defaultCountry: countryValue != null
                      ? CscCountry.values.firstWhere(
                          (e) =>
                              e.name.toLowerCase() == countryValue!.toLowerCase(),
                          orElse: () => CscCountry.United_States,
                        )
                      : null,
                ),

                SizedBox(height: 16.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(isArabic ? 'إلغاء' : 'Cancel',
                          style: TextStyle(fontSize: 14.sp)),
                    ),
                    SizedBox(width: 8.w),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          countryValue = tempCountry;
                          stateValue = tempState;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text(isArabic ? 'تأكيد' : 'Confirm',
                          style: TextStyle(fontSize: 14.sp)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final selectedText = (countryValue != null && stateValue != null)
        ? (isArabic ? '$countryValue، $stateValue' : '$stateValue, $countryValue')
        : (isArabic ? 'اختر الموقع' : 'Select Location');

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: InkWell(
        onTap: () => _showLocationSelector(context),
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          width: 141.w,
          height: 24.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.white),
          ),
          child: Row(
            children: [
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 24.sp,
                color: AppColors.mediumGrey,
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Text(
                  selectedText,
                  style: AppTextStyles.smallTextAr.copyWith(fontSize: 12.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 3.w),
              SvgPicture.asset(
                'assets/icons/world_longitude.svg',
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.grey,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
