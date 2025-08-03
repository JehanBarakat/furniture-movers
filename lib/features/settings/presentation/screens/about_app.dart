import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/constants/app_colors.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'حول التطبيق',
        trailingIcon: const Icon(Icons.arrow_forward_ios),
        onTrailingPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0), // حذف الـ vertical padding هنا
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                text: TextSpan(
                  style: const TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    height: 1.0,
                    color: AppColors.black,
                  ),
                  children: [
                    const TextSpan(text: 'تطبيق '),
                    TextSpan(
                      text: 'خدماتك',
                      style: const TextStyle(
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    const TextSpan(text: ' لخدمة نقل الأثاث لنظام الأندرويد'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                title: 'مقدمة',
                content:
                'هو تطبيق شامل يقدم لك جميع الخدمات المنزلية التي تحتاجها في مكان واحد، سواء كنت تبحث عن نقل الأثاث، تنظيف المنزل، أو صيانة الأجهزة. يمكن لتطبيق "خدماتك" تلبية جميع احتياجاتك بسهولة وأمان، مع خدمات حجز الخدمة التي ترغب بها بسهولة والاستمتاع براحة البال.',
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                title: 'مميزات التطبيق:',
                contentWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildFeature(
                        '1. تنوع الخدمات: نقل الأثاث، تنظيف شامل، صيانة الأجهزة، والمزيد.'),
                    _buildFeature(
                        '2. سهولة الحجز: واجهة مستخدم سهلة وبسيطة وتتيح لك حجز الخدمات في دقائق.'),
                    _buildFeature(
                        '3. جودة عالية: فريق متخصص من المهنيين لضمان أفضل جودة للخدمات.'),
                    _buildFeature(
                        '4. الأمان: ضمان سلامة ممتلكاتك أثناء تقديم الخدمات.'),
                    _buildFeature(
                        '5. تقييمات موثوقة: مراجعات من مستخدمين آخرين تضمن راحتك.'),
                    _buildFeature(
                        'جرّب خدماتنا اليوم واحصل على أفضل سعر مع مجموعة متنوعة من الخدمات المنزلية المتاحة بنقرة واحدة!'),
                  ],
                ),
              ),
              const SizedBox(height: 20), // المسافة بين الكارد وكلمة الإصدار
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'الإصدار',
                      style: TextStyle(
                        fontFamily: 'Almarai',
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 2),
                    Text(
                      '1.0.0',
                      style: TextStyle(
                        fontFamily: 'Almarai',
                        fontSize: 14,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildInfoCard({
    required String title,
    String? content,
    Widget? contentWidget,
  }) {
    return Container(
      width: 386,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          right: BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'Almarai',
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          if (content != null)
            Text(
              content,
              style: const TextStyle(
                color: AppColors.grey,
                fontSize: 14,
                fontFamily: 'Almarai',
                fontWeight: FontWeight.w400,
                height: 26 / 14,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
          if (contentWidget != null) contentWidget,
        ],
      ),
    );
  }

  static Widget _buildFeature(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.grey,
          fontSize: 14,
          fontFamily: 'Almarai',
          fontWeight: FontWeight.w400,
          height: 26 / 14,
        ),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
      ),
    );
  }
}
