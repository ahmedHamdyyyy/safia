import 'package:flutter/material.dart';
import 'package:safiaa/core/helpers/guest_user_mixin.dart';

class ProtectedRoute extends StatelessWidget with GuestUserMixin {
  final Widget child;
  final String? message;

  const ProtectedRoute({
    super.key,
    required this.child,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    if (isGuestUser()) {
      handleGuestAction(
        context,
        action: () {},
        message: message ?? 'يجب تسجيل الدخول للوصول إلى هذه الصفحة',
      );
      return const SizedBox.shrink();
    }
    return child;
  }
} 