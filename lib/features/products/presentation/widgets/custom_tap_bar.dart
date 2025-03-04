import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/features/products/data/models/categories.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.categories,
  });

  final List<Categories> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  categories[1].image.toString(),
                  height: 40.h,
                ),
                Text(
                  categories[1].name.toString(),
                  style: getBoldStyle(
                    color: MyColors.black,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
