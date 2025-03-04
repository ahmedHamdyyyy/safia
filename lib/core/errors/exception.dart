import 'package:flutter/material.dart';

class AppError {
  final String message;
  AppError(this.message);

  @override
  String toString() => message;
}

class NetworkError extends AppError {
  NetworkError() : super("تحقق من اتصال الإنترنت وحاول مرة أخرى.");
}

class ServerError extends AppError {
  ServerError() : super("هناك مشكلة في الخادم (500)، يرجى المحاولة لاحقًا.");
}

class UnauthorizedError extends AppError {
  UnauthorizedError() : super("يجب تسجيل الدخول للوصول إلى هذه الميزة (401).");
}

class NotFoundError extends AppError {
  NotFoundError() : super("المورد المطلوب غير متوفر (404).");
}

class BadRequestError extends AppError {
  BadRequestError() : super("طلب غير صالح (400)، يرجى التحقق من البيانات المدخلة.");
}

class ForbiddenError extends AppError {
  ForbiddenError() : super("ليس لديك الصلاحية للوصول إلى هذا المورد (403).");
}

class TimeoutError extends AppError {
  TimeoutError() : super("انتهت مهلة الاتصال، يرجى المحاولة لاحقًا (408).");
}

class UnexpectedError extends AppError {
  UnexpectedError() : super("حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.");
}

AppError handleError(int statusCode) {
  switch (statusCode) {
    case 400:
      return BadRequestError();
    case 401:
      return UnauthorizedError();
    case 403:
      return ForbiddenError();
    case 404:
      return NotFoundError();
    case 408:
      return TimeoutError();
    case 500:
      return ServerError();
    default:
      return UnexpectedError();
  }
}

void showError(BuildContext context, int statusCode) {
  final errorMessage = handleError(statusCode).message;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      backgroundColor: Colors.red,
    ),
  );
}
