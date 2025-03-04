import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safiaa/core/helpers/build_error_bar.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/core/widgets/custom_app_bar.dart';
import 'package:safiaa/core/widgets/custom_botton.dart';
import 'package:safiaa/core/widgets/custom_text_form_field.dart';
import 'package:safiaa/features/auth/data/models/register_model.dart';
import 'package:safiaa/features/auth/presentation/cubit/auth_cubit.dart';

class ForgetPassEmail extends StatefulWidget {
  const ForgetPassEmail({super.key});

  @override
  State<ForgetPassEmail> createState() => _ForgetPassEmailState();
}

class _ForgetPassEmailState extends State<ForgetPassEmail> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? email; // استخدام String? بدلاً من late
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SendOtpToMailStepOne) {
            context.pushReplacementNamed(forgotPassOtp);
          } else if (state is AuthError) {
            // Show error message
            buildErrorBar(context, 'البريد الالكتروني غير صحيح');
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomAppBar(
                    title: 'نسيت كلمة المرور',
                  ),
                  verticalSpace(28),
                  Text(
                    'من فضلك أدخل بريدك الإلكتروني لاسترداد كلمة المرور. سيتم إرسال رمز تحقق (OTP) إلى بريدك الإلكتروني، يمكنك استخدامه لإعادة تعيين كلمة المرور الخاصة بك بسهولة وأمان. تأكد من إدخال بريد إلكتروني صالح',
                    style: getSemiBoldStyle(
                        color: MyColors.grayscale500, fontSize: 14.sp),
                  ),
                  verticalSpace(68),
                  CustomTextFormField(
                    hintText: 'البريد الالكتروني',
                    prefixIcon: SvgPicture.asset('assets/images/mailIcon.svg'),
                    onSaved: (value) {
                      email = value!;
                    },
                  ),
                  const Spacer(),
                  state is AuthLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomBotton(
                          text: 'الحصول علي كود التحقق',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              context
                                  .read<AuthCubit>()
                                  .forgetPassword(RegisterModelinp(
                                    email: email!,
                                  ));
                            } else {
                              setState(() {
                                autoValidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                        ),
                  verticalSpace(40)
                ]),
          );
        },
      ),
    );
  }
}
