import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/guest_user_mixin.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';

class CartPage extends StatelessWidget with GuestUserMixin {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (isGuestUser()) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'سلة المشتريات',
            style: getBoldStyle(
              color: MyColors.black,
              fontSize: 18.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 80.sp,
                color: MyColors.grayscale400,
              ),
              verticalSpace(20),
              Text(
                'السلة فارغة',
                style: getBoldStyle(
                  color: MyColors.grayscale600,
                  fontSize: 20.sp,
                ),
              ),
              verticalSpace(8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Text(
                  'قم بتسجيل الدخول لإضافة منتجات إلى السلة',
                  textAlign: TextAlign.center,
                  style: getRegularStyle(
                    color: MyColors.grayscale500,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              verticalSpace(24),
              ElevatedButton(
                onPressed: () => navigateToLogin(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.blue500,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'تسجيل الدخول',
                  style: getMediumStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return const CartPageContent();
  }
}

class CartPageContent extends StatelessWidget {
  const CartPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Your existing cart page implementation
    return const Scaffold(
      // ... your cart page implementation
    );
  }
} 