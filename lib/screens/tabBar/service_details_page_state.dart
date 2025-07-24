import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';

class RatingSummaryWidget extends StatelessWidget {
  final double avgRating;
  final int totalRates;
  final Map<int, double> starsPercent;

  const RatingSummaryWidget({
    super.key,
    required this.avgRating,
    required this.totalRates,
    required this.starsPercent,
  });

  void _showAddRateSheet(BuildContext context) {
    double selectedRating = 0;
    final commentController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 18.h,
            top: 20.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'إضافة تقييم',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14.h),
              // نجوم التقييم
              StatefulBuilder(
                builder: (context, setState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          selectedRating > index
                              ? Icons.star
                              : Icons.star_border,
                          color: AppColors.accentOrange,
                          size: 32.sp,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {
                          setState(() {
                            selectedRating = index + 1.0;
                          });
                        },
                      );
                    }),
                  );
                },
              ),
              SizedBox(height: 18.h),
              TextField(
                controller: commentController,
                minLines: 2,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'اكتب تعليق',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColors.mediumGrey),
                  ),
                  filled: true,
                  fillColor: AppColors.veryLightGrey,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  onPressed: () {
                    
                    Navigator.pop(ctx);
                  },
                  child: Text(
                    'موافق',
                    style: TextStyle(fontSize: 16.sp, color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(5, (i) {
                    int star = 5 - i;
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Row(
                        children: [
                          Text(
                            '$star',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.black,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: 16.sp,
                            color: AppColors.accentOrange,
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: starsPercent[star]!,
                              minHeight: 7.h,
                              backgroundColor: AppColors.lightGrey,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primaryBlue,
                              ),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            '${(starsPercent[star]! * 100).round()}%',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(width: 28.w),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        avgRating.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.star,
                        color: AppColors.accentOrange,
                        size: 26.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'تقييم $totalRates',
                    style: TextStyle(fontSize: 13.sp, color: AppColors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30.h),
          AddReviewButton(onTap: () => _showAddRateSheet(context)),
        ],
      ),
    );
  }
}

class AddReviewButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddReviewButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 380.w,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primaryBlue, AppColors.linearBlue],
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            'إضافة تقييم',
            style: TextStyle(
              fontSize: 18.sp, // صغرته شوي
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Almarai',
            ),
          ),
        ),
      ),
    );
  }
}
