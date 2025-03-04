import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6.w),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        // trailing: SvgPicture.asset(
        //   'assets/images/shopping-cart.svg',
        //   width: 25.w,
        // ),
        leading: Image.asset('assets/images/app_icon.png'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'مرحبا بك في تطبيق صافيا ',
              // getUser().phoneNumber.toString(),
              style: getBoldStyle(
                color: MyColors.black,
                fontSize: 10.sp,
              ),
            ),
            verticalSpace(6),
            Text(
              'تصفح جميع المنتجات واطلب وسوف يصل اليك بنقرة زر',
              style: getMediumStyle(
                color: MyColors.grayscale500,
                fontSize: 8.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
