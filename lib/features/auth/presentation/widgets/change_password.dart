import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/injection_container.dart' as di;
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/widgets/custom_app_bar.dart';
import 'package:safiaa/core/widgets/custom_botton.dart';
import 'package:safiaa/core/widgets/custom_text_form_field.dart';
import 'package:safiaa/features/auth/data/models/register_model.dart';
import 'package:safiaa/features/auth/presentation/cubit/auth_cubit.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthCubit>(),
      child: const Scaffold(
        body: SafeArea(child: ChangePasswordBody()),
      ),
    );
  }
}

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? email, password, confPass;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SendOtpToMailStepThree) {
          context.pushReplacementNamed(login);
        } else if (state is AuthError) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${state.message}')),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                CustomAppBar(
                  title: 'تغيير كلمة المرور',
                ),
                verticalSpace(36),
                CustomTextFormField(
                  hintText: 'البريد الالكتروني',
                  prefixIcon: SvgPicture.asset('assets/images/mailIcon.svg'),
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                verticalSpace(22),
                CustomTextFormField(
                  hintText: 'كلمة المرور',
                  prefixIcon: SvgPicture.asset('assets/images/lockIcon.svg'),
                  obscureText: true,
                  onSaved: (value) {
                    password = value!;
                  },
                  suffixIcon: Icons.remove_red_eye_outlined,
                ),
                verticalSpace(22),
                CustomTextFormField(
                  hintText: 'تاكيد كلمة المرور',
                  prefixIcon: SvgPicture.asset('assets/images/lockIcon.svg'),
                  obscureText: true,
                  onSaved: (value) {
                    confPass = value!;
                  },
                  suffixIcon: Icons.remove_red_eye_outlined,
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
                            context.read<AuthCubit>().confermPassword(
                                  RegisterModelinp(
                                    email: email!,
                                    password: password!,
                                    confPass: confPass!,
                                  ),
                                );
                          } else {
                            setState(() {
                              autoValidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      ),
                verticalSpace(40)
              ],
            ),
          ),
        );
      },
    );
  }
}
