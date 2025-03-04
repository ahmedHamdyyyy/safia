import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/core/widgets/custom_botton.dart';
import 'package:safiaa/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:safiaa/features/cart/presentation/widgets/cart_item.dart';
import 'package:safiaa/features/orders/presentation/pages/add_order_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  // void initState() {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartLoaded) {
          final cartItems = state.items;
          
          // Check if cart is empty
          if (cartItems.items == null || cartItems.items!.isEmpty) {
            return _buildEmptyCart();
          }
          
          return Column(
            children: [
              verticalSpace(15),
              Center(
                  child: Text(
                'عربة التسوق',
                style: getBoldStyle(
                  color: MyColors.black,
                  fontSize: 20.sp,
                ),
              )),
              verticalSpace(12),
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.items?.length ?? 0,
                  itemBuilder: (context, index) {
                    return CartItem(
                      items: cartItems.items![index],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'السعر:  ${cartItems.totalPrice ?? 0}\ ريال',
                      style: getBoldStyle(
                        color: MyColors.grayscale500,
                        fontSize: 16.sp,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'الضريبة&التوصيل:  ${cartItems.totalPrice ?? 0}\ ريال',
                      style: getBoldStyle(
                        color: MyColors.grayscale500,
                        fontSize: 16.sp,
                      ),
                    ),
                    const Divider(),
                    Text(
                      'الاجمالي:  ${cartItems.totalPrice ?? 0}\ ريال',
                      // 'الاجمالي: ${totalCost.toStringAsFixed(2)} \$',
                      style: getBoldStyle(
                        color: MyColors.prime,
                        fontSize: 16.sp,
                      ),
                    ),
                    verticalSpace(10),
                    CustomBotton(
                      text: 'اكمال الطلب',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddOrderView(),
                          ),
                        );
                        //dispose the instance
                        BlocProvider.of<CartCubit>(context).close();
                      },
                    ),
                    verticalSpace(20),
                  ],
                ),
              ),
            ],
          );
        } else {
          return _buildEmptyCart();
        }
      },
    );
  }

  // Extract empty cart UI to a separate method
  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/cart.png'),
          verticalSpace(30),
          Text(
            'لا يوجد منتجات في عربة التسوق',
            style: getBoldStyle(
              color: MyColors.grayscale500,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
