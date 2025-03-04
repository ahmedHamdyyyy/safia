import 'package:flutter/material.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/features/auth/presentation/widgets/custom_check_box.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key, required this.onChecked, this.text});

  final ValueChanged<bool> onChecked;
  final Widget? text;

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool isTermAccepted = false;

  _RememberMeState();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            setState(() {
              isTermAccepted = value;
              widget.onChecked(value);
            });
          },
          isChecked: isTermAccepted,
        ),
        horizontalSpace(10),
        widget.text ?? const SizedBox(),
        // RichText(
        //   text: TextSpan(
        //     text: "من خلال إنشاء حساب, فإنك توافق على ",
        //     style: getSemiBoldStyle(
        //       color: MyColors.grayscale400,
        //       fontSize: 15,
        //     ),
        //     children: [
        //       TextSpan(
        //         text: 'الشروط \nوالاحكام الخاصة بنا',
        //         style: getSemiBoldStyle(
        //           color: MyColors.green700,
        //           fontSize: 15,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Spacer(),
        GestureDetector(
          onTap: () {
             context
                      .pushNamed(passwordReset);
          },
          child: Text(
            'هل نسيت كلمة المرور؟',
            style: getRegularStyle(
              color: MyColors.prime,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
