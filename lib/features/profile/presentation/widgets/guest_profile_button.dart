import 'package:flutter/material.dart';
import 'package:safiaa/core/helpers/guest_user_mixin.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';

class GuestProfileButton extends StatelessWidget with GuestUserMixin {
  const GuestProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.blue500,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () => navigateToLogin(context),
        child: Text(
          'تسجيل الدخول للوصول إلى ملفك الشخصي',
          style: getMediumStyle(
            color: MyColors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
} 