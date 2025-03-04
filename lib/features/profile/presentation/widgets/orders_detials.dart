//build order details scern
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/widgets/custom_app_bar.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';
import 'package:safiaa/features/profile/presentation/widgets/custom_text_rich.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key, required this.order}) : super(key: key);
  final OrderResponse order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'تفاصيل الطلب',
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: order.items?.length,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColors.prime),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          order.items![index].image!,
                          width: 160.w,
                        ),
                      ),
                      horizontalSpace(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextRich(
                              titel: 'اسم المنتج: ',
                              subTitle: order.items![index].title!),
                          verticalSpace(2),
                          CustomTextRich(
                              titel: 'الكمية: ',
                              subTitle:
                                  order.items![index].quantity.toString()),
                          verticalSpace(2),
                          CustomTextRich(
                              titel: 'عنوان الشحن: ',
                              subTitle: order.shippingAddress.toString()),
                          verticalSpace(2),
                          CustomTextRich(
                              titel: 'سعر المنتج: ',
                              subTitle:
                                  order.items![index].totalPrice.toString()),
                          verticalSpace(2),
                        ],
                      ),
                    ],
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
