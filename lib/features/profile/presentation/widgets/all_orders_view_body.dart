import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/features/profile/presentation/cubits/cubit/profile_cubit.dart';
import 'package:safiaa/features/profile/presentation/widgets/custom_text_rich.dart';

class AllOrdersBody extends StatelessWidget {
  const AllOrdersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is OrdersError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is OrdersLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is OrdersLoaded) {
          final orders = state.orders;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.prime),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/app_icon.png',
                      height: 80.h,
                    ),
                    horizontalSpace(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextRich(
                            titel: 'حالة الطلب: ',
                            subTitle: order.status.toString()),
                        verticalSpace(2),
                        CustomTextRich(
                            titel: 'رقم الطلب: ',
                            subTitle: order.number.toString()),
                        verticalSpace(2),
                        CustomTextRich(
                            titel: 'عنوان الشحن: ',
                            subTitle: order.shippingAddress.toString()),
                        verticalSpace(2),
                        CustomTextRich(
                            titel: 'سعر الطلب: ',
                            subTitle: order.totalAmount.toString()),
                        verticalSpace(2),
                        CustomTextRich(
                          titel: 'تاريخ الطلب: ',
                          subTitle: order.orderDate != null
                              ? DateFormat.yMMMd()
                                  .format(DateTime.parse(order.orderDate!))
                              : 'Date not available',
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ordersView,
                          arguments: order,
                        );
                      },
                      child: Text(
                        'تفاصيل الطلب',
                        style: getMediumStyle(
                            color: MyColors.prime, fontSize: 12.sp),
                      ),
                    ),
                    horizontalSpace(8),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('No orders found'),
          );
        }
      },
    );
  }
}
