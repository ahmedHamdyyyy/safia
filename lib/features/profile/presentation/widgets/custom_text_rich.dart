import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich(
      {super.key, required this.titel, required this.subTitle});
  final String titel, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      child: Text.rich(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        TextSpan(
          children: [
            TextSpan(
              text: titel,
              style: getSemiBoldStyle(
                color: MyColors.prime,
                fontSize: 14.sp,
              ),
            ),
            TextSpan(
              text: subTitle,
              style: getRegularStyle(
                color: MyColors.grayscale500,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
