import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';
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
          titlePadding: const EdgeInsets.all(8.0),
          searchCursorColor: Colors.black,
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
        const SizedBox(width: 8.0),
        Text("+${country.phoneCode}"),
        const SizedBox(width: 8.0),
        Expanded(child: Text(country.name)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // تحديد اتجاه كامل العنصر بناءً على لغة التطبيق
    TextDirection overallDirection =
        Localizations.localeOf(context).languageCode == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr;

    return Directionality(
      textDirection: overallDirection,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 380,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.veryLightGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: _openCountryPickerDialog,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.phone,
                    // **اتجاه النص داخل حقل رقم الهاتف LTR دائمًا**
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '1012445665 (+${_selectedCountry.phoneCode})',
                      contentPadding: const EdgeInsets.only(bottom: 12),
                    ),
                    onChanged: (_) {
                      final full = '+${_selectedCountry.phoneCode}${_controller.text}';
                      widget.onChanged?.call(full);
                    },
                  ),
                ),
                const SizedBox(width: 4),
                CountryPickerUtils.getDefaultFlagImage(_selectedCountry),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
