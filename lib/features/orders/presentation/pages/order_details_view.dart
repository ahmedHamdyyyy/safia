import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/injection_container.dart' as di;
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/core/widgets/custom_app_bar.dart';
import 'package:safiaa/core/widgets/custom_botton.dart';
import 'package:safiaa/core/widgets/custom_text_form_field.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';
import 'package:safiaa/features/orders/domain/repositories/copouns_repo.dart';
import 'package:safiaa/features/orders/presentation/cubit/copoun_cubit.dart';
import 'package:safiaa/features/orders/presentation/widgets/test.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({Key? key, required this.orderResponse})
      : super(key: key);
  final OrderResponse orderResponse;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CopounCubit(di.sl<CopounsRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: OrderDetailsViewBody(orderResponse: orderResponse),
        ),
      ),
    );
  }
}

class OrderDetailsViewBody extends StatefulWidget {
  const OrderDetailsViewBody({Key? key, required this.orderResponse})
      : super(key: key);
  final OrderResponse orderResponse;

  @override
  State<OrderDetailsViewBody> createState() => _OrderDetailsViewBodyState();
}

class _OrderDetailsViewBodyState extends State<OrderDetailsViewBody> {
  String? copon;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  double? discountedPrice; // السعر بعد الخصم

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CopounCubit, CopounState>(
      builder: (context, state) {
        double finalPrice =
            discountedPrice ?? widget.orderResponse.netPrice!; // السعر الحالي

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    title: 'تفاصيل الطلب',
                    onPressed: () => context.pushReplacementNamed(homeView),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.blue200, width: 1.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildProductsList(),
                            verticalSpace(15),
                            buildDetailsCard(),
                            verticalSpace(15),
                            buildOrderDetails(finalPrice),
                            verticalSpace(15),

                            buildCopounField(context),
                            verticalSpace(15),
                            //
                            buildCopounResult(context, state),
                            verticalSpace(15),
                            buildPaymentButton(finalPrice),
                            verticalSpace(15),
                            CustomBotton(
                              text: 'الدفع عند الاستلام',
                              onPressed: () {
                                context.pushReplacementNamed(homeView);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildOrderDetails(double price) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              margin: EdgeInsets.only(right: 30.w, left: 30.w),
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Text(
                'حالة الطلب: ${widget.orderResponse.status}',
                textAlign: TextAlign.center,
                style: getRegularStyle(color: MyColors.black, fontSize: 16.sp),
              ),
            ),
            verticalSpace(10),
            _buildDetailRow('رقم الطلب:', widget.orderResponse.number),
            verticalSpace(10),
            _buildDetailRow('السعر الأجمالي:', price.toString()),
          ],
        ),
      ),
    );
  }

  Widget buildDetailsCard() {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'معلومات التوصيل',
              style: getBoldStyle(color: MyColors.black, fontSize: 16.sp),
            ),
            SizedBox(height: 12.h),
            _buildDetailRow('الاسم:', widget.orderResponse.userName),
            _buildDetailRow('رقم الهاتف:', widget.orderResponse.contactNumber),
            _buildDetailRow('العنوان:', widget.orderResponse.shippingAddress),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:
                getMediumStyle(color: MyColors.grayscale600, fontSize: 14.sp),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              value ?? '',
              style: getRegularStyle(color: MyColors.black, fontSize: 14.sp),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCopounField(BuildContext context) {
    return Row(
      children: [
        CustomTextFormField(
          hight: 10.h,
          width: 180.w,
          prefixIcon:
              Image.asset('assets/images/copon.png', width: 20.w, height: 20.h),
          hintText: 'هل لديك كوبون؟',
          onSaved: (value) => copon = value,
        ),
        horizontalSpace(5),
        CustomBotton(
          height: 48.h,
          fontSize: 12.sp,
          text: 'اضافة الكوبون',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              context.read<CopounCubit>().getCopouns(copon!);
            } else {
              setState(() {
                autoValidateMode = AutovalidateMode.always;
              });
            }
          },
          width: 110.w,
        ),
      ],
    );
  }

  Widget buildProductsList() {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'المنتجات',
              style: getBoldStyle(color: MyColors.black, fontSize: 16.sp),
            ),
            SizedBox(height: 12.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.orderResponse.items?.length ?? 0,
              separatorBuilder: (context, index) => Divider(height: 16.h),
              itemBuilder: (context, index) {
                final item = widget.orderResponse.items![index];
                return Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        item.image ?? '',
                        width: 60.w,
                        height: 60.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 60.w,
                          height: 60.w,
                          color: Colors.grey[200],
                          child: Icon(Icons.error, color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title ?? '',
                            style: getMediumStyle(
                              color: MyColors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '${item.quantity} × ${item.unitPrice} ريال',
                            style: getRegularStyle(
                              color: MyColors.grayscale500,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${(item.quantity ?? 0) * (item.unitPrice ?? 0)} ريال',
                      style: getBoldStyle(
                        color: MyColors.blue500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCopounResult(BuildContext context, CopounState state) {
    if (state is CopounLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is CopounLoaded) {
      setState(() {
        discountedPrice = state.copoun.netPrice; // تحديث السعر بعد الخصم
      });
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'السعر بعد الخصم: ${state.copoun.netPrice}',
            style: getBoldStyle(color: MyColors.black, fontSize: 14.sp),
          ),
          verticalSpace(10),
          Text(
            'الخصم: ${state.copoun.couponeCode}',
            style: getBoldStyle(color: MyColors.black, fontSize: 14.sp),
          ),
        ],
      );
    } else if (state is CopounError) {
      return Text(
        'ربما يكون هذا الكود خاطئ',
        style: getBoldStyle(color: MyColors.black, fontSize: 14.sp),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buildPaymentButton(double finalPrice) {
    return CustomBotton(
      text: 'ادفع الان',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PayMentPage(
                orderResponse:
                    widget.orderResponse.copyWith(netPrice: finalPrice)),
          ),
        );
      },
    );
  }
}
