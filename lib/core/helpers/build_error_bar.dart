import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    closeIconColor: Colors.white,
    dismissDirection: DismissDirection.horizontal,
    content: Text(message),
  ));
}
