import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/build_error_bar.dart';
import 'package:safiaa/core/helpers/injection_container.dart' as di;
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/core/widgets/water_drop_loading.dart';
import 'package:safiaa/features/auth/presentation/cubit/auth_cubit.dart';

import '../../data/models/log_model.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            buildErrorBar(context, state.message);
          } else if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, homeView);
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: MyColors.white,
              body: Stack(
                children: [
                  // Background Design
                  Positioned(
                    top: -100.h,
                    right: -50.w,
                    child: Container(
                      width: 200.w,
                      height: 200.w,
                      decoration: BoxDecoration(
                        color: MyColors.blue500.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -80.h,
                    left: -40.w,
                    child: Container(
                      width: 160.w,
                      height: 160.w,
                      decoration: BoxDecoration(
                        color: MyColors.blue500.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  // Main Content
                  SafeArea(
                    child: SizedBox.expand(
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    SizedBox(height: 40.h),

                                    // Logo
                                    Container(
                                      height: 120.h,
                                      width: 120.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 10,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/logo.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 32.h),
                                    Text(
                                      'مرحباً بك',
                                      style: getBoldStyle(
                                        color: MyColors.blue500,
                                        fontSize: 28,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      'قم بتسجيل الدخول للمتابعة',
                                      style: getMediumStyle(
                                        color: MyColors.grayscale600,
                                        fontSize: 16,
                                      ),
                                    ),

                                    SizedBox(height: 32.h),

                                    // Email Field
                                    TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: 'البريد الإلكتروني',
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: MyColors.blue500,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: MyColors.grayscale300,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: MyColors.blue500,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال البريد الإلكتروني';
                                        }
                                        return null;
                                      },
                                    ),

                                    SizedBox(height: 16.h),

                                    // Password Field
                                    TextFormField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: 'كلمة المرور',
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: MyColors.blue500,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: MyColors.grayscale300,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: MyColors.blue500,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال كلمة المرور';
                                        }
                                        return null;
                                      },
                                    ),

                                    SizedBox(height: 24.h),

                                    // Login Button
                                    ElevatedButton(
                                      onPressed: state is AuthLoading
                                          ? null
                                          : () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                // Handle login
                                                context
                                                    .read<AuthCubit>()
                                                    .userLogin(
                                                      LogModel(
                                                        email: _emailController
                                                            .text,
                                                        password:
                                                            _passwordController
                                                                .text,
                                                      ),
                                                    );
                                              }
                                            },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: MyColors.blue500,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.h),
                                        minimumSize:
                                            Size(double.infinity, 48.h),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        'تسجيل الدخول',
                                        style: getBoldStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 16.h),

                                    // Forgot Password
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, passwordReset);
                                      },
                                      child: Text(
                                        'نسيت كلمة المرور؟',
                                        style: getMediumStyle(
                                          color: MyColors.blue500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 24.h),

                                    // Divider
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                              color: MyColors.grayscale300),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.w),
                                          child: Text(
                                            'أو',
                                            style: getMediumStyle(
                                              color: MyColors.grayscale600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(
                                              color: MyColors.grayscale300),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 24.h),

                                    // Guest Login
                                    TextButton(
                                      onPressed: () {
                                        context
                                            .read<AuthCubit>()
                                            .loginAsGuest();
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.h),
                                        minimumSize:
                                            Size(double.infinity, 48.h),
                                      ),
                                      child: Text(
                                        'الدخول كزائر',
                                        style: getMediumStyle(
                                          color: MyColors.blue500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 24.h),

                                    // Sign Up Link
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ليس لديك حساب؟',
                                          style: getRegularStyle(
                                            color: MyColors.grayscale600,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, singUp);
                                          },
                                          child: Text(
                                            'إنشاء حساب',
                                            style: getMediumStyle(
                                              color: MyColors.blue500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Loading Overlay
                  if (state is AuthLoading)
                    const Positioned.fill(
                      child: WaterDropLoading(),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
