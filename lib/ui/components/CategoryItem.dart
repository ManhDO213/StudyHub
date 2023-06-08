import 'package:du_an_fpt/configs/colors.dart';
import 'package:du_an_fpt/models/CategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.only(right: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.greenX),
            child: Image.asset(
              category.imageUrl,
              width: 60.w,
              fit: BoxFit.fitWidth,
              // height: 80.h,
            ),
          ),
          SizedBox(height: 12.h,),
          Text(
            category.title,
            style: TextStyle(
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: AppColors.gray700),
          )
        ],
      ),
    );
  }
}
