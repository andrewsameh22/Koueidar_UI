import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_router/routes.dart';
import 'app_colors.dart';

BuildContext? customContext =
    AppRouter.router.routerDelegate.navigatorKey.currentContext;

abstract class MyTextStyles {
  //caption 12
  static TextStyle textStyle12Regular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );

  static TextStyle textStyle12Medium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle12Bold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.defaultTextColor,
  );

  //body 14
  static TextStyle textStyle14Regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle14Medium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle14Bold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.defaultTextColor,
  );

  static TextStyle hintStyle = TextStyle(
    fontSize: 15.sp,
    color: Colors.grey,
  );

  //subtitle 16

  static TextStyle textStyle16Regular = TextStyle(
    fontSize: 16.sp,
    // fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle16Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle16Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.defaultTextColor,
  );

  //subtitle 18
  static TextStyle textStyle18Regular = TextStyle(
    fontSize: 18.sp,
    // fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle18Medium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle18Bold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.defaultTextColor,
  );

  //subtitle 20
  static TextStyle textStyle20Regular = TextStyle(
    fontSize: 20.sp,
    // fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle20Medium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle20Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.defaultTextColor,
  );

  //title  22
  static TextStyle textStyle22Regular = TextStyle(
    fontSize: 22.sp,
    // fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle22Medium = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle22Bold = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.defaultTextColor,
  );

  //title  24
  static TextStyle textStyle24Regular = TextStyle(
    fontSize: 24.sp,
    // fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle24Medium = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle24Bold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.defaultTextColor,
  );

  //title  26
  static TextStyle textStyle26Regular = TextStyle(
    fontSize: 26.sp,
    // fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle26Medium = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle26Bold = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.defaultTextColor,
  ); //title  28
  static TextStyle textStyle28Regular = TextStyle(
    fontSize: 28.sp,
    // fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle28Medium = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle28Bold = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.defaultTextColor,
  );

  //Headline 34
  static TextStyle textStyle34Regular = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle34Medium = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );
  static TextStyle textStyle34Bold = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.defaultTextColor,
  );
}
