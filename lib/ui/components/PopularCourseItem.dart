import 'package:du_an_fpt/configs/colors.dart';
import 'package:du_an_fpt/configs/images.dart';
import 'package:du_an_fpt/models/CourseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularCourseItem extends StatelessWidget {
  final Course course;

  const PopularCourseItem({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150.w,
          margin: EdgeInsets.only(left: 6.w, right: 18.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.kPrimaryColor),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                margin: EdgeInsets.only(top: 32.h),
                child: Column(
                  children: [
                    Image.asset(
                      course.imageUrl,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.natureGrey, width: 1.5))),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.title,
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: AppColors.blackA),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          '\$ ${course.price}',
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: AppColors.greenM),
                        ),
                      ],
                    ),
                    Container(
                      height: 30.h,
                      width: 30.w,
                      padding: EdgeInsets.all(8.sp),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.r),
                              bottomLeft: Radius.circular(8.r)),
                          color: AppColors.greenM),
                      child: Image.asset(AppImages.imgPlus,
                          color: AppColors.kPrimaryColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 12.h),
            child: discountPopularItem(course.discount)),
      ],
    );
  }
}

Widget discountPopularItem(int discount) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
            color: AppColors.greenM,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.r),
                topLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r))),
        child: Text('${discount}% OFF',
            style: TextStyle(
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: AppColors.kPrimaryColor)),
      ),
      CustomPaint(
        size: Size(6.w, 6.w),
        painter: RightTrianglePainter(AppColors.greenM),
      )
    ],
  );
}

class RightTrianglePainter extends CustomPainter {
  final Color color;

  RightTrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(RightTrianglePainter oldDelegate) => false;
}
