import 'package:flutter/material.dart';
import 'package:safiaa/core/helpers/guest_user_mixin.dart';

class OrderView extends StatelessWidget with GuestUserMixin {
  const OrderView({super.key});

  void _handleOrder(BuildContext context) {
    handleGuestAction(
      context,
      message: 'يجب تسجيل الدخول لإتمام عملية الطلب',
      action: () {
        // Your order creation logic here
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Your order view content
          ElevatedButton(
            onPressed: () => _handleOrder(context),
            child: const Text('إتمام الطلب'),
          ),
        ],
      ),
    );
  }
} 