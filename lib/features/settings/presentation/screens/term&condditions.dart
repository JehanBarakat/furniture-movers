import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/constants/app_colors.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'شروط الخدمة', onTrailingPressed: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 379,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: 'Almarai',
                        fontSize: 15,
                        height: 1.6,
                        color: AppColors.black,
                      ),
                      children: [
                        const TextSpan(text: 'مرحباً بك في '),
                        TextSpan(
                          text: 'خدماتك!',
                          style: TextStyle(
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            height: 24 / 14,
                            letterSpacing: 0,
                            color: AppColors.primaryBlue,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const TextSpan(
                          text:
                              '، قبل استخدام تطبيقنا، يرجى قراءة شروط الخدمة التالية بعناية:',
                        ),
                      ],
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 8),
                  ..._termsList.map((e) => _buildTerm(e)).toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildTerm(_TermItem item) {
    const noBulletTitles = {
      'قبول الشروط',
      'التحديث على الشروط',
      'القانون المعمول به',
      'الاتصال بنا',
    };

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${item.number}. ${item.title}',
            style: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Almarai',
              fontSize: 14,
              height: 1.7,
              letterSpacing: 0,
            ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
          ),
          if (item.bullets != null)
            Padding(
              padding: const EdgeInsets.only(top: 2.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: item.bullets!
                    .map(
                      (b) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text.rich(
                          TextSpan(
                            text: '• ',
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.w700,
                              height: 1.7,
                            ),
                            children: [
                              TextSpan(
                                text: b,
                                style: const TextStyle(
                                  color: AppColors.grey,
                                  fontFamily: 'Almarai',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  height: 1.7,
                                ),
                              ),
                            ],
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          else if (item.text != null)
            Padding(
              padding: const EdgeInsets.only(top: 2.0, right: 8.0),
              child: Text.rich(
                TextSpan(
                  text: noBulletTitles.contains(item.title) ? '' : '• ',
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w700,
                    height: 1.7,
                  ),
                  children: [
                    TextSpan(
                      text: item.text!,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
            ),
        ],
      ),
    );
  }

  static const List<_TermItem> _termsList = [
    _TermItem(
      number: 1,
      title: 'قبول الشروط',
      text:
          'باستخدامك لتطبيق خدماتك، فإنك توافق على الالتزام بشروط الخدمة هذه. إذا كنت لا توافق على أي جزء من الشروط، يجب عليك عدم استخدام التطبيق.',
    ),
    _TermItem(
      number: 2,
      title: 'التحديث على الشروط',
      text:
          'نحتفظ بالحق في تعديل شروط الخدمة في أي وقت. سيتم إعلامك بهذه التعديلات عبر التطبيق أو البريد الإلكتروني.\n'
          'استمرارك في استخدام التطبيق بعد التعديلات يعني موافقتك على الشروط المعدلة.',
    ),
    _TermItem(
      number: 3,
      title: 'استخدام التطبيق',
      bullets: [
        'يجب أن تكون فوق السن القانوني المسموح به لاستخدام التطبيق.',
        'يجب تقديم معلومات دقيقة وكاملة عند التسجيل واستخدام التطبيق.',
        'يمنع استخدام التطبيق لأي أغراض غير قانونية أو غير مصرح بها.',
      ],
    ),
    _TermItem(
      number: 4,
      title: 'الخدمات المقدمة',
      bullets: [
        'يوفر خدماتك مجموعة متنوعة من الخدمات المنزلية بما في ذلك نقل الأثاث، التنظيف، وصيانة الأجهزة.',
        'نحن نسعى لتقديم خدمات عالية الجودة من خلال محترفين ذوي خبرة.',
        'قد تختلف توفر الخدمات والأسعار حسب الموقع والوقت.',
      ],
    ),
    _TermItem(
      number: 5,
      title: 'الدفع',
      bullets: [
        'يتم تحديد أسعار الخدمات في التطبيق.',
        'يجب دفع الرسوم المطلوبة باستخدام وسائل الدفع المتاحة في التطبيق.',
        'قد نفرض رسوم إلغاء في حال إلغاء الخدمة بعد تأكيد الحجز.',
      ],
    ),
    _TermItem(
      number: 6,
      title: 'المسؤولية',
      bullets: [
        'نحن نبذل قصارى جهدنا لضمان سلامة وجودة الخدمات المقدمة، ولكننا لا نتحمل مسؤولية أي أضرار أو خسائر تنشأ عن استخدام التطبيق أو الخدمات المقدمة.',
        'يتم تقديم الخدمات كما هي، دون أي ضمانات صريحة أو ضمنية.',
      ],
    ),
    _TermItem(
      number: 7,
      title: 'الإلغاء والاسترداد',
      bullets: [
        'يمكنك إلغاء الخدمة عبر التطبيق، ولكن قد يتم تطبيق رسوم إلغاء حسب وقت الإلغاء.',
        'في حالة عدم الرضا عن الخدمة، يرجى التواصل معنا عبر الدعم لنظر في طلبات الاسترداد.',
      ],
    ),
    _TermItem(
      number: 8,
      title: 'الخصوصية',
      bullets: [
        'نحن نحترم خصوصيتك ونتعهد بحماية بياناتك الشخصية وفقًا لسياسة الخصوصية الخاصة بنا.',
      ],
    ),
    _TermItem(
      number: 9,
      title: 'القانون المعمول به',
      text: 'تخضع شروط الخدمة هذه وتفسر وفقًا لقوانين [الدولة/المنطقة].',
    ),
    _TermItem(
      number: 10,
      title: 'الاتصال بنا',
      text:
          'لأي استفسارات أو ملاحظات حول شروط الخدمة، يرجى الاتصال بنا عبر [البريد الإلكتروني أو رقم الهاتف].',
    ),
  ];
}

class _TermItem {
  final int number;
  final String title;
  final String? text;
  final List<String>? bullets;

  const _TermItem({
    required this.number,
    required this.title,
    this.text,
    this.bullets,
  });
}

