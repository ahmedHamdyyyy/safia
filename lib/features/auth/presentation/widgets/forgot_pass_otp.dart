import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/build_error_bar.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/injection_container.dart' as di;
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/core/widgets/custom_app_bar.dart';
import 'package:safiaa/core/widgets/custom_botton.dart';
import 'package:safiaa/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safiaa/features/auth/presentation/widgets/custom_otp.dart';

class ForgotPassOtp extends StatefulWidget {
  const ForgotPassOtp({super.key});

  @override
  State<ForgotPassOtp> createState() => _ForgotPassOtpState();
}

class _ForgotPassOtpState extends State<ForgotPassOtp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => di.sl<AuthCubit>(),
        child: const Scaffold(body: SafeArea(child: ForgotPassOtpBody())));
  }
}

class ForgotPassOtpBody extends StatefulWidget {
  const ForgotPassOtpBody({super.key});

  @override
  State<ForgotPassOtpBody> createState() => _ForgotPassOtpBodyState();
}

class _ForgotPassOtpBodyState extends State<ForgotPassOtpBody> {
  final TextEditingController _otpCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SendOtpToMailStepTwo) {
          context.pushNamed(changePassword);
        } else if (state is AuthError) {
         buildErrorBar(context, 'الرجاء التحقق من الكود');
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(title: 'التحقق من البريد الالكتروني'),
              verticalSpace(28),
              Text(
                'يرجى إدخال رمز التحقق المرسل إلى بريدك الإلكتروني لإعادة تعيين كلمة المرور.',
                style: getSemiBoldStyle(
                  fontSize: 14.sp,
                  color: MyColors.grayscale500,
                ),
              ),
              OtpWidget(
                otpCodeController: _otpCodeController,
              ),
              const Spacer(),
              state is AuthLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomBotton(
                      text: 'تحقق من الكود',
                      onPressed: () {
                        final otpCode = _otpCodeController.text.trim();
                        if (otpCode.isEmpty || otpCode.length != 6) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('الرجاء إدخال كود صالح'),
                            ),
                          );
                        } else {
                          context
                              .read<AuthCubit>()
                              .forgotPassConfirmotp(otpCode);
                        }
                      },
                    ),
              verticalSpace(40),
            ],
          ),
        );
      },
    );
  }
}
