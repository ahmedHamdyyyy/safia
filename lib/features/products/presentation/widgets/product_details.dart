import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/features/products/data/models/categories.dart';
import 'package:safiaa/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:safiaa/core/helpers/guest_user_mixin.dart';

class ProductDetails extends StatelessWidget with GuestUserMixin {
  final Products products;

  const ProductDetails({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, size: 24.sp),
                  ),
                  Text(
                    products.title!,
                    style: getBoldStyle(
                      color: MyColors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Product Image
                    Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.network(
                          products.image!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // Product Info Card
                    Container(
                      margin: EdgeInsets.all(16.w),
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category
                          Row(
                            children: [
                              Icon(
                                Icons.category_outlined,
                                color: MyColors.prime,
                                size: 20.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                products.category!,
                                style: getMediumStyle(
                                  color: MyColors.grayscale600,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(16),

                          // Description
                          Text(
                            "الوصف:",
                            style: getBoldStyle(
                              color: MyColors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          verticalSpace(8),
                          Text(
                            products.description!,
                            style: getRegularStyle(
                              color: MyColors.grayscale600,
                              fontSize: 14.sp,
                            ),
                          ),
                          verticalSpace(16),

                          // Quantity
                          Row(
                            children: [
                              Icon(
                                Icons.inventory_2_outlined,
                                color: MyColors.prime,
                                size: 20.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                "الكمية المتوفرة: ${products.quantity} قطعة",
                                style: getMediumStyle(
                                  color: MyColors.grayscale600,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Bar with Price and Add to Cart
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "السعر",
                  style: getRegularStyle(
                    color: MyColors.grayscale600,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  "${products.price} ريال",
                  style: getBoldStyle(
                    color: MyColors.prime,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: ElevatedButton(
                onPressed: () => handleGuestAction(
                  context,
                  action: () {
                    context
                        .read<ProductsCubit>()
                        .addItemToCart(products.id!, 1);
                  },
                  message: 'يجب تسجيل الدخول لإضافة المنتج إلى السلة',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.prime,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'إضافة إلى السلة',
                  style: getBoldStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
