import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/core/widgets/custom_app_bar.dart';
import 'package:safiaa/core/widgets/custom_botton.dart';
import 'package:safiaa/core/widgets/custom_text_form_field.dart';
import 'package:safiaa/features/auth/data/models/log_model.dart';
import 'package:safiaa/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safiaa/features/auth/presentation/widgets/remember_me.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late bool isTermAccepted = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(),
              verticalSpace(18),
              SvgPicture.asset('assets/images/login.svg', height: 250.h),
              verticalSpace(13),
              CustomTextFormField(
                hintText: 'البريد الالكتروني',
                boarderColor: MyColors.grayscale200,
                prefixIcon: SvgPicture.asset('assets/images/mailIcon.svg'),
                onSaved: (value) {
                  email = value!;
                },
              ),
              verticalSpace(15),
              CustomTextFormField(
                hintText: 'كلمة المرور',
                boarderColor: MyColors.grayscale200,
                prefixIcon: SvgPicture.asset('assets/images/lockIcon.svg'),
                obscureText: true,
                onSaved: (value) {
                  password = value!;
                },
                suffixIcon: Icons.remove_red_eye_outlined,
              ),
              verticalSpace(18),
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
              verticalSpace(24),
              CustomBotton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    context
                        .read<AuthCubit>()
                        .userLogin(LogModel(email: email, password: password));
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              verticalSpace(16),
              GestureDetector(
                onTap: () {
                  context.pushNamed(singUp);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ليس لديك حساب؟ ',
                      style: getSemiBoldStyle(
                        color: MyColors.grayscale500,
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      'إنشئ حساب الآن',
                      style: getSemiBoldStyle(
                        color: MyColors.darkPrime,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
