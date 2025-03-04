import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/build_error_bar.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/core/widgets/custom_app_bar.dart';
import 'package:safiaa/core/widgets/custom_botton.dart';
import 'package:safiaa/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safiaa/features/auth/presentation/widgets/custom_otp.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  final TextEditingController _otpCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthOtpConfirmed) {
            Shareds.setBool(isloged, true);

            context.pushNamed(homeView);
          } else if (state is AuthError) {
            // Show error message
            buildErrorBar(context, 'الرجاء التحقق من الكود');
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              verticalSpace(16),

              CustomAppBar(
                title: 'تحقق من الكود',
              ),
              verticalSpace(24),
              Text('تم إرسال كود التحقق إلى الايميل الخاص بك',
                  style: getRegularStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                  )),
              verticalSpace(16),
              OtpWidget(
                otpCodeController: _otpCodeController,
              ),
              verticalSpace(28),
              // Button with state management
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
                          context.read<AuthCubit>().confirmOtp(otpCode);
                        }
                      },
                    ),
            ],
          );
        },
      ),
    );
  }
}
