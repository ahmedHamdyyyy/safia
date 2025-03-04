import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/features/auth/presentation/widgets/custom_check_box.dart';

class AcceptTermsCondation extends StatefulWidget {
  const AcceptTermsCondation({
    super.key,
    required this.onChecked,
  });

  final ValueChanged<bool> onChecked;

  @override
  State<AcceptTermsCondation> createState() => _RememberMeState();
}

class _RememberMeState extends State<AcceptTermsCondation> {
  bool isTermAccepted = false;

  _RememberMeState();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermAccepted = value;
            widget.onChecked(value);
            setState(() {});
          },
          isChecked: isTermAccepted,
        ),
        horizontalSpace(10),
        // widget.text ?? const SizedBox(),
        GestureDetector(
          onTap: () {
            context.pushNamed(termAndCond);
          },
          child: RichText(
            text: TextSpan(
              text: "من خلال إنشاء حساب, فإنك توافق على ",
              style: getSemiBoldStyle(
                color: MyColors.grayscale400,
                fontSize: 13.sp,
              ),
              children: [
                TextSpan(
                  text: 'الشروط \nوالاحكام الخاصة بنا',
                  style: getSemiBoldStyle(
                    color: MyColors.darkPrime,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
