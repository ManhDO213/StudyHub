import 'package:du_an_fpt/configs/colors.dart';
import 'package:du_an_fpt/configs/string.dart';
import 'package:du_an_fpt/models/PromotionModel.dart';
import 'package:du_an_fpt/ui/components/light_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromotionItem extends StatelessWidget {
  final Promotion promotion;

  const PromotionItem({Key? key, required this.promotion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: AppColors.greenX),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${promotion.discount}% OFF',
                  style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      color: AppColors.blackA),
                ),
                Text(
                  promotion.content,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppColors.blackA),
                ),
                SizedBox(
                  width: 100.w,
                  child: LightButton(
                      color: AppColors.greenM,
                      child: const Text(AppStrings.stgBuyNow,
                          style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Rubik')),
                      onPressed: () async {}),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Image.asset(
            promotion.imageUrl,
            height: 80.h,
            width: 80.w,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
