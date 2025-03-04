import 'package:flutter/material.dart';
import 'package:safiaa/core/helpers/guest_user_mixin.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';

class ProtectedPage extends StatelessWidget with GuestUserMixin {
  final Widget child;
  final String message;
  final String? imagePath;

  const ProtectedPage({
    super.key,
    required this.child,
    this.message = 'يجب تسجيل الدخول للوصول إلى هذه الصفحة',
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    if (isGuestUser()) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imagePath != null)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(imagePath!, height: 150),
                ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: MyColors.grayscale600,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => navigateToLogin(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.blue500,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'تسجيل الدخول',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return child;
  }
} 