import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/guest_user_mixin.dart';
import 'package:safiaa/core/helpers/injection_container.dart' as di;
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/features/cart/domain/repositories/cart_repo.dart';
import 'package:safiaa/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:safiaa/features/cart/presentation/widgets/cart_view_body.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> with GuestUserMixin {
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

    return BlocProvider(
      create: (context) => CartCubit(di.sl<CartRepo>())..fetchCartItems(),
      child: Scaffold(
        body: SafeArea(
          child: CartViewBody(),
        ),
      ),
    );
  }
}
