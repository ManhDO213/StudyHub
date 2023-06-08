import 'dart:async';

import 'package:du_an_fpt/configs/colors.dart';
import 'package:du_an_fpt/configs/images.dart';
import 'package:du_an_fpt/configs/string.dart';
import 'package:du_an_fpt/models/CategoryModel.dart';
import 'package:du_an_fpt/models/CourseModel.dart';
import 'package:du_an_fpt/models/PromotionModel.dart';
import 'package:du_an_fpt/ui/components/CategoryItem.dart';
import 'package:du_an_fpt/ui/components/PopularCourseItem.dart';
import 'package:du_an_fpt/ui/components/PromotionItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollCategoryController = ScrollController();
  final ScrollController _scrollPopularController = ScrollController();
  final PageController _pageController = PageController(initialPage: 0);
  FocusNode _focusNode = FocusNode();
  int _currentPageIndex = 0;
  final List<Category> _listCategories = [
    Category(imageUrl: AppImages.imgPronounce, title: 'Pronounce'),
    Category(imageUrl: AppImages.imgPronounce, title: 'Reading'),
    Category(imageUrl: AppImages.imgPronounce, title: 'Grammar'),
    Category(imageUrl: AppImages.imgPronounce, title: 'Writing'),
    Category(imageUrl: AppImages.imgPronounce, title: 'Listenning')
  ];
  final List<Promotion> _listPromotions = [
    Promotion(
        discount: 50,
        imageUrl: AppImages.imgPronounce,
        content: 'Discount courses for newbies'),
    Promotion(
        discount: 50,
        imageUrl: AppImages.imgPronounce,
        content: 'Discount courses for newbies'),
    Promotion(
        discount: 50,
        imageUrl: AppImages.imgPronounce,
        content: 'Discount courses for newbies'),
    Promotion(
        discount: 50,
        imageUrl: AppImages.imgPronounce,
        content: 'Discount courses for newbies'),
    Promotion(
        discount: 50,
        imageUrl: AppImages.imgPronounce,
        content: 'Discount courses for newbies')
  ];

  final List<Course> _listCourses = [
    Course(
        price: 5,
        content: '',
        discount: 40,
        imageUrl: AppImages.imgPronounce,
        title: 'Pronounce'),
    Course(
        price: 5,
        content: '',
        discount: 40,
        imageUrl: AppImages.imgPronounce,
        title: 'Reading'),
    Course(
        price: 5,
        content: '',
        discount: 40,
        imageUrl: AppImages.imgPronounce,
        title: 'Grammar'),
    Course(
        price: 5,
        content: '',
        discount: 40,
        imageUrl: AppImages.imgPronounce,
        title: 'Writing'),
    Course(
        price: 5,
        content: '',
        discount: 40,
        imageUrl: AppImages.imgPronounce,
        title: 'Listenning')
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPageIndex < _listPromotions.length - 1) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.sPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      child: Container(
                        padding: EdgeInsets.only(left: 12.w),
                        height: 50.h,
                        decoration: const BoxDecoration(
                          color: AppColors.kPrimaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 12.w),
                              child: Image.asset(
                                AppImages.imgSearch,
                                height: 24.h,
                                width: 24.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                  controller: _searchController,
                                  focusNode: _focusNode,
                                  onTapOutside: (event) {
                                    _focusNode.unfocus();
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: AppStrings.stgSearchContent,
                                      hintStyle: TextStyle(
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.sp,
                                          color: AppColors.whiteG
                                              .withOpacity(0.7)))),
                            ),
                            Container(
                              width: 50.w,
                              height: 50.h,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: AppColors.greenM,
                              ),
                              child: Image.asset(
                                AppImages.imgFilter,
                                color: AppColors.kPrimaryColor,
                                height: 24.h,
                                width: 24.w,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          AppStrings.stgCategory,
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                              color: AppColors.blackA),
                        ),
                        Text(
                          AppStrings.stgSeeAll,
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                              color: AppColors.greenM),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                height: 135.h,
                child: ListView.builder(
                    controller: _scrollCategoryController,
                    padding: EdgeInsets.only(left: 24.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: _listCategories.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        category: _listCategories[index],
                      );
                    }),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.stgDeal,
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          color: AppColors.blackA),
                    ),
                    Text(
                      AppStrings.stgSeeAll,
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp,
                          color: AppColors.greenM),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                height: 170.h,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _listPromotions.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return PromotionItem(
                      promotion: _listPromotions[index],
                    );
                  },
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.stgPopularCourses,
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          color: AppColors.blackA),
                    ),
                    Text(
                      AppStrings.stgSeeAll,
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp,
                          color: AppColors.greenM),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                height: 230.h,
                child: ListView.builder(
                    controller: _scrollPopularController,
                    padding: EdgeInsets.only(left: 18.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: _listCategories.length,
                    itemBuilder: (context, index) {
                      return PopularCourseItem(
                        course: _listCourses[index],
                      );
                    }),
              ),
              SizedBox(
                height: 24.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
