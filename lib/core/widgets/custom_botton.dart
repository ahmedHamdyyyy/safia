import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    this.radius,
    required this.text,
    required this.onPressed,
    this.height,
    this.textColor,
    this.fontSize,
    this.color,
    this.width,
  });
  final String? text;
  final double? radius;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Function()? onPressed;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius ?? 16.sp,
          ),
        ),
        color:color ?? MyColors.prime,
      ),
      width: width ?? double.infinity,
      height: height ?? 60.h,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text ?? "",
          maxLines: 1,
          textAlign: TextAlign.center,
          style: getBoldStyle(
            color:textColor ?? Colors.white,
            fontSize: fontSize ?? 16.sp,
          ),
        ),
      ),
    );
  }
}
