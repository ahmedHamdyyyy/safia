import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';

class TextAndMoreRow extends StatelessWidget {
  const TextAndMoreRow({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: getSemiBoldStyle(
            color: MyColors.black,
            fontSize: 18.sp,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'المزيد',
            style: getRegularStyle(
              color: MyColors.prime,
              fontSize: 14.sp,
            ).copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
