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
import 'package:safiaa/features/auth/presentation/widgets/accept_terms_condation.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late bool isTermAccepted = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String userName, email, password, phoneNumber, confPass;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(
                title: 'انشاء حساب',
              ),
              verticalSpace(16),
              Text(
                'إبدأ رحلتك مع صافيا - المدينة بسهولة! قم بإنشاء حساب للاستمتاع بأجود أنواع المياة المعدنية وتتبع طلباتك. أكمل التفاصيل أدناه وكن جزءًا من مجتمعنا.',
                style: getRegularStyle(color: MyColors.black, fontSize: 14.sp),
              ),
              verticalSpace(16),
              CustomTextFormField(
                hintText: 'الاسم',
                prefixIcon: SvgPicture.asset('assets/images/personIcone.svg'),
                onSaved: (value) {
                  userName = value!;
                },
              ),
              verticalSpace(12),
              CustomTextFormField(
                hintText: 'رقم الهاتف',
                prefixIcon: SvgPicture.asset('assets/images/phoneIcon.svg'),
                onSaved: (value) {
                  phoneNumber = value!;
                },
              ),
              verticalSpace(12),
              CustomTextFormField(
                hintText: 'البريد الالكتروني',
                prefixIcon: SvgPicture.asset('assets/images/mailIcon.svg'),
                onSaved: (value) {
                  email = value!;
                },
              ),
              verticalSpace(12),
              CustomTextFormField(
                hintText: 'كلمة المرور',
                prefixIcon: SvgPicture.asset('assets/images/lockIcon.svg'),
                onSaved: (value) {
                  password = value!;
                },
                obscureText: true,
                suffixIcon: Icons.remove_red_eye_outlined,
              ),
              verticalSpace(12),
              CustomTextFormField(
                hintText: 'تاكيد كلمة المرور',
                prefixIcon: SvgPicture.asset('assets/images/lockIcon.svg'),
                onSaved: (value) {
                  confPass = value!;
                },
                obscureText: true,
                suffixIcon: Icons.remove_red_eye_outlined,
              ),
              verticalSpace(12),
              AcceptTermsCondation(
                onChecked: (bool value) {
                  isTermAccepted = value;
                },
              ),
              verticalSpace(24),
              CustomBotton(
                text: 'تأكيد الحساب',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermAccepted) {
                      // if (password != confPass) showSnackBar(context, 'كلمة المرور غير متطابقة');
                      if (password != confPass) {
                        buildErrorBar(context, 'كلمة المرور غير متطابقة');
                      } else if (password.length < 8) {
                        buildErrorBar(context, 'كلمة المرور يجب ان تكون اكثر من 8 احرف');
                      }else{
                         context.read<AuthCubit>().userRegister(
                            RegisterModelinp(
                              name: userName,
                              phone: phoneNumber,
                              confPass: confPass,
                              email: email,
                              password: password,
                            ),
                          );
                      }

                     

                      print(phoneNumber.toString());
                    } else {
                      buildErrorBar(context, 'يجب عليك الموافقة على الشروط');
                    }
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              verticalSpace(18),
              GestureDetector(
                onTap: () {
                  
                  context.pushNamed(login);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لديك حساب بالفعل؟ ',
                      style: getSemiBoldStyle(
                        color: MyColors.grayscale500,
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      'تسجيل دخول',
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

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/popup_done.svg'),
            verticalSpace(20),
            Text(
              'تم إنشاء حسابك بنجاح!',
              style: getBoldStyle(color: MyColors.black, fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            verticalSpace(10),
            Text(
              'تهانينا! لقد تم إنشاء حسابك بنجاح. يمكنك الآن الوصول إلى الصفحة الرئيسية واكتشاف الأكلات المنزلية الشهية.',
              style: getRegularStyle(
                  color: MyColors.grayscale500, fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            verticalSpace(20),
            CustomBotton(
              text: 'الصفحة الرئيسية',
              onPressed: () {},
              height: 45.h,
            ),
          ],
        ),
      );
    },
  );
}
