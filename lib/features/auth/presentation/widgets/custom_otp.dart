import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key, this.otpCodeController});
  final TextEditingController? otpCodeController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      verticalSpace(100),
      Text(
        'كود التحقق',
        textAlign: TextAlign.center,
        style: getMediumStyle(fontSize: 24.sp, color: MyColors.black),
      ),
      Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 10, left: 29, right: 29),
        child: SizedBox(
          width: double.infinity,
          child: PinFieldAutoFill(
            controller: otpCodeController,
            codeLength: 6,
            decoration: UnderlineDecoration(
              textStyle: const TextStyle(fontSize: 20, color: Colors.black),
              colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.9)),
            ),
            onCodeSubmitted: (code) {
              otpCodeController?.text = code;
            },
            onCodeChanged: (code) {},
          ),
        ),
      ),
    ]);
  }
}
