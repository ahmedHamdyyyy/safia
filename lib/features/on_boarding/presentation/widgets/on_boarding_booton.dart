import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';

class OnBoardingBotton extends StatelessWidget {
  const OnBoardingBotton({
    super.key,
    this.radius,
    required this.onPressed,
    this.height,
    this.fontSize,
    this.width,
  });

  final double? radius;
  final double? width;
  final double? height;
  final Function()? onPressed;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius ?? 12.sp,
          ),
        ),
        color: MyColors.prime,
      ),
      width: width ?? double.infinity,
      height: height,
      child: GestureDetector(
          onTap: onPressed,
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 30.sp,
            color: MyColors.white,
          )),
    );
  }
}
