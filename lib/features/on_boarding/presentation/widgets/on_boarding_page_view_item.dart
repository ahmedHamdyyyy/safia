import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';

class OnBoardingPageViewIteam extends StatelessWidget {
  const OnBoardingPageViewIteam({
    super.key,
    required this.background,
    required this.title,
    required this.isVisible,
    required this.cricterImage,
    required this.description,
    required this.height,
  });

  final String background, title, cricterImage, description;
  final bool isVisible;
  final double height;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Logo Image
        Container(
          height: 80.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SvgPicture.asset(
            'assets/images/on_boarding_image1.svg',
            fit: BoxFit.contain,
          ),
        ),
        
        // Main Content
        SizedBox(
          height: height,
          child: Stack(
            children: [
              SvgPicture.asset(
                background,
                fit: BoxFit.fill,
                width: 390.w,
              ),
              if (isVisible)
                Positioned(
                  top: 60.h,
                  right: 20.w,
                  child: GestureDetector(
                    onTap: () {
                      Shareds.setBool(isOnBoardSeen, true);
                      context.pushReplacementNamed(login);
                    },
                    child: Text(
                      'تخطي',
                      style: getSemiBoldStyle(
                        color: MyColors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        
        // Content Image
        SvgPicture.asset(
          cricterImage,
          width: 600.w,
          height: 280.h, // Reduced height to accommodate top logo
          fit: BoxFit.contain,
        ),
        
        verticalSpace(14),
        
        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: getBlackStyle(
            color: MyColors.grayscale500,
            fontSize: 18.sp,
          ),
        ),
        
        verticalSpace(10),
        
        // Description
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: getSemiBoldStyle(
              color: MyColors.grayscale500,
              fontSize: 14.sp,
            ).copyWith(height: 1.5),
          ),
        ),
      ],
    );
  }
}
