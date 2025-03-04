import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/core/widgets/custom_botton.dart';
import 'package:safiaa/features/products/data/models/categories.dart';
import 'package:safiaa/features/products/presentation/cubit/products/products_cubit.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({
    super.key,
    required this.products,
  });
  final Products products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(productsDetails, arguments: products);
      },
      child: Container(
        width: 200.w,
        height: 260.h,
        margin: EdgeInsets.only(right: 6.w),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: MyColors.prime,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          shadows: [
            BoxShadow(
              color: MyColors.grayscale150,
              blurRadius: 4,
              offset: const Offset(0, 4),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.h,
            right: 10.w,
            left: 10.w,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  products.image!,
                  width: 200.w,
                  height: 120.h,
                  fit: BoxFit.fill,
                ),
              ),
              horizontalSpace(11),
              Text(
                products.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getBoldStyle(
                  color: MyColors.grayscale900,
                  fontSize: 14.sp,
                ),
              ),
              verticalSpace(6),
              SizedBox(
                height: 27.h,
                child: Text(
                  products.description!,
                  textAlign: TextAlign.center,
                  style: getRegularStyle(
                    color: MyColors.grayscale500,
                    fontSize: 10.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              verticalSpace(9),
              CustomBotton(
                text: 'اضافة الى السلة',
                height: 40.h,
                width: 200.w,
                fontSize: 10.sp,
                onPressed: () {
                  context.read<ProductsCubit>().addItemToCart(products.id!, 1);
                },
              ),
              verticalSpace(6),
            ],
          ),
        ),
      ),
    );
  }
}
