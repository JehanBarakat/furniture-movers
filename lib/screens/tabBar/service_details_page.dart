import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/screens/tabBar/servi_cedetails.dart';
import 'package:furnituremovers/screens/tabBar/service_details_page_state.dart';
import 'package:furnituremovers/core/services/employee_service.dart';
import 'package:furnituremovers/core/models/employee_comment.dart';

class ServiceDetailsPage extends StatefulWidget {
  const ServiceDetailsPage({super.key});

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController _questionController = TextEditingController();

  List<EmployeeComment> _comments = [];
  bool _isLoading = true;
  String? _errorMessage;
  final int _employeeId = 1;

  final List<Question> _fallbackQuestions = [
    Question(
      name: 'عبدالله محمد',
      timeAgo: 'منذ دقيقتين',
      text: 'كيفكم اخباركم ؟ كيف يمكنني معرفة وقت الخدمة ؟',
    ),
    Question(
      name: 'عبدالله محمد',
      timeAgo: 'منذ 5 دقائق',
      text: 'كيفكم اخباركم ؟ كيف يمكنني معرفة وقت الخدمة ؟',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
    _loadComments();
  }

  Future<void> _loadComments() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final comments = await EmployeeService.getEmployeeComments(_employeeId);
      setState(() {
        _comments = comments;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _questionController.dispose();
    super.dispose();
  }

  void _submitQuestion() {
    final text = _questionController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _fallbackQuestions.insert(0, Question(name: 'أنت', timeAgo: 'الآن', text: text));
      _questionController.clear();
    });
  }

  List<Question> get _questions {
    if (_isLoading || _errorMessage != null || _comments.isEmpty) {
      return _fallbackQuestions;
    }
    
    return _comments.map((comment) {
      String timeAgo = 'منذ لحظات';
      if (comment.createdAt != null) {
        final now = DateTime.now();
        final difference = now.difference(comment.createdAt!);
        if (difference.inDays > 0) {
          timeAgo = 'منذ ${difference.inDays} يوم';
        } else if (difference.inHours > 0) {
          timeAgo = 'منذ ${difference.inHours} ساعة';
        } else if (difference.inMinutes > 0) {
          timeAgo = 'منذ ${difference.inMinutes} دقيقة';
        }
      }
      
      return Question(
        name: 'مستخدم ${comment.id ?? 'غير محدد'}',
        timeAgo: timeAgo,
        text: comment.question ?? comment.answer ?? 'لا يوجد نص',
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.lightPrimaryGrey,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('معلومات الفني', style: AppTextStyles.heading2Ar),
          leading: Padding(
            padding: EdgeInsets.only(right: 20.w, left: 5.w, bottom: 15.h),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: 48.w,
                width: 48.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: Color(0xFFDEE2E6), width: 2),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 28.sp,
                    color: Color(0xFF97A0B4),
                  ),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _loadComments,
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 140.h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(color: AppColors.white),
                  Positioned(
                    top: 12.h,
                    left: 16.w,
                    right: 16.w,
                    child: Container(
                      height: 140.h,
                      decoration: BoxDecoration(
                        color: AppColors.mediumPrimary,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -58.h,
                    right: 32.w,
                    child: Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 48.r,
                        backgroundImage: const AssetImage(
                          'assets/images/40d4e5e21bde813f700606f55f2b5f772e729131.jpg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 64.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: AppColors.white,
                  unselectedLabelColor: AppColors.grey,
                  labelStyle: AppTextStyles.smallTextAr.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: AppTextStyles.smallTextAr.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  tabs: const [
                    Tab(text: 'تفاصيل'),
                    Tab(text: 'التقييم'),
                    Tab(text: 'الأسئلة'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.h),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ServiceDetailsCard(employeeId: 1,),

                  Center(
                    child: RatingSummaryWidget(
                      avgRating: 4.5,
                      totalRates: 36,
                      starsPercent: {
                        5: 0.60,
                        4: 0.15,
                        3: 0.15,
                        2: 0.06,
                        1: 0.04,
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 12.h),
                          decoration: BoxDecoration(
                            color: AppColors.veryLightGrey,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _questionController,
                                  decoration: InputDecoration(
                                    hintText: 'طرح سؤال',
                                    hintStyle: AppTextStyles.smallTextAr,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 14.h,
                                      horizontal: 8.w,
                                    ),
                                  ),
                                  onSubmitted: (_) => _submitQuestion(),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.send_rounded,
                                  color: AppColors.primaryBlue,
                                  size: 26.sp,
                                ),
                                onPressed: _submitQuestion,
                                splashRadius: 22.sp,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryBlue.withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.primaryBlue,
                                    size: 24.sp,
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    'ترتيب',
                                    style: AppTextStyles.smallTextAr.copyWith(
                                      color: AppColors.primaryBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '${_questions.length} أسئلة',
                              style: AppTextStyles.smallTextAr,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        if (_isLoading)
                          const Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: AppColors.primaryBlue,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'جاري تحميل التعليقات...',
                                    style: TextStyle(
                                      fontFamily: 'Almarai',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else if (_errorMessage != null)
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.error_outline,
                                    size: 64,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'حدث خطأ في تحميل التعليقات',
                                    style: TextStyle(
                                      fontFamily: 'Almarai',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    _errorMessage!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Almarai',
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: _loadComments,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryBlue,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      'إعادة المحاولة',
                                      style: TextStyle(fontFamily: 'Almarai'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          Expanded(
                            child: ListView.separated(
                            itemCount: _questions.length,
                            separatorBuilder: (_, __) => SizedBox(height: 16.h),
                            itemBuilder: (context, index) {
                              final q = _questions[index];
                              final bool isSecond = index == 1;
                              final iconAsset = isSecond
                                  ? 'assets/icons/personline.svg'
                                  : 'assets/icons/person.svg';
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 12.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.veryLightGrey,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      iconAsset,
                                      width: 32.w,
                                      height: 32.w,
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            q.name,
                                            style: AppTextStyles.bodyTextAr,
                                          ),
                                          SizedBox(height: 4.h),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8.w,
                                              vertical: 2.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF5F6FA),
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                            ),
                                            child: Text(
                                              q.timeAgo,
                                              style: AppTextStyles.smallTextAr
                                                  .copyWith(fontSize: 12.sp),
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  q.text,
                                                  style:
                                                      AppTextStyles.smallTextAr,
                                                ),
                                              ),
                                              if (isSecond) ...[
                                                SizedBox(width: 8.w),
                                                Icon(
                                                  Icons.group,
                                                  color: AppColors.primaryBlue,
                                                  size: 22.sp,
                                                ),
                                              ],
                                            ],
                                          ),
                                          if (!isSecond) ...[
                                            SizedBox(height: 8.h),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.reply,
                                                    size: 18.sp,
                                                    color:
                                                        AppColors.primaryBlue,
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                    'رد',
                                                    style: AppTextStyles
                                                        .smallTextAr
                                                        .copyWith(
                                                          color: AppColors
                                                              .primaryBlue,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String name;
  final String timeAgo;
  final String text;
  Question({required this.name, required this.timeAgo, required this.text});
}
