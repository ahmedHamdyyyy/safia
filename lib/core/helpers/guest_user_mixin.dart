import 'package:flutter/material.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';

mixin GuestUserMixin {
  bool isGuestUser() {
    // Check if user is in guest mode AND doesn't have a valid token
    return Shareds.getBool('isGuestUser') && Shareds.getString(prefsKeyToken).isEmpty;
  }

  void handleGuestAction(BuildContext context, {
    required VoidCallback action,
    String message = 'يجب تسجيل الدخول للقيام بهذا الإجراء',
  }) {
    if (isGuestUser()) {
      Future.microtask(() {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: const Text('تنبيه'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'إلغاء',
                  style: TextStyle(color: MyColors.grayscale600),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, login);
                },
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(color: MyColors.blue500),
                ),
              ),
            ],
          ),
        );
      });
    } else {
      action();
    }
  }

  void navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, login);
  }
} 