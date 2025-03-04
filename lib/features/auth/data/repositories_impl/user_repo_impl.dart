import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:safiaa/core/errors/exception.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/core/recourses/global_model.dart';
import 'package:safiaa/features/auth/data/models/log_model.dart';
import 'package:safiaa/features/auth/data/models/register_model.dart';
import 'package:safiaa/features/auth/data/repositrie/user_repos.dart';

import '../../../../core/helpers/api_services.dart';

class UserRepoImpl extends UserRepo {
  final DioHelper dioHelper;
  final GlobalModel globalModel;

  UserRepoImpl(this.dioHelper, this.globalModel);
  @override
  Future<Either<Failure, RegisterModel>> userLogin(LogModel userEntity) async {
    try {
      var response = await dioHelper.postData(url: '/api/Account/login', data: {
        'email': userEntity.email,
        'password': userEntity.password,
      });
      if (response.statusCode == 200) {
        final registerModel = RegisterModel.fromJson(response.data);

        //save token in sherds
        Shareds.setString(prefsKeyToken, registerModel.token.toString());
        String token = Shareds.getString(prefsKeyToken);
        log('Token: $token');
        Shareds.setString(prefsKeyId, registerModel.userId.toString());

        // globalModel.setRegisterModel(registerModel);
        String userId = Shareds.getString(prefsKeyId);

        log('UserId: $userId');
        //save userId in sherds
        // globalModel.sa(registerModel.userId);

        return right(RegisterModel.fromJson(response.data));
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (e) {
      return left(ServerFailure(UnexpectedError().message));
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> userRegister(
      RegisterModelinp userEntity) async {
    try {
      var response = await dioHelper.postData(
        url: '/api/Account/register',
        data: {
          'email': userEntity.email,
          'password': userEntity.password,
          'firstName': userEntity.name,
          'phoneNumber': userEntity.phone,
          'confirmPassword': userEntity.confPass,
          'token': userEntity.token
        },
      );

      log(response.data.toString());

      if (response.statusCode == 200) {
        return right(RegisterModel.fromJson(response.data));
      } else {
        // التأكد من وجود 'message' في الاستجابة وإعادتها
        final errorMessage = response.data?['message'] ?? 'حدث خطأ غير معروف';
        return left(ServerFailure(errorMessage));
      }
    } on DioException catch (e) {
      // التعامل مع أخطاء Dio لاستخراج الرسالة بشكل صحيح
      final errorMessage = e.response?.data?['message'] ?? 'حدث خطأ غير معروف';
      return left(ServerFailure(errorMessage));
    } catch (e) {
      return left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> userConfirmotp(
      RegisterModel userEntity, String otpCode) async {
    try {
      var registerModel = globalModel.getRegisterModel();
      if (registerModel == null) {
        return left(ServerFailure("Register model is not set"));
      }
      var response = await dioHelper.postData(
        url: '/api/Account/confirmEmail',
        data: {
          'email': registerModel.email,
          'emailConfirmationToken': registerModel.emailConfirmationToken,
          'otpCode': otpCode.toString(),
        },
      );
      if (response.statusCode == 200) {
        //save userId in sherds

        Shareds.setString(prefsKeyId, response.data['userId'].toString());
        String userId = Shareds.getString(prefsKeyId);
        log('UserId: $userId');

        return right(RegisterModel.fromJson(response.data));
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (e) {
      return left(ServerFailure(UnexpectedError().message));
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> forgetPassword(
      RegisterModelinp userEntity) async {
    try {
      var response = await dioHelper
          .postData(url: '/api/Account/sendOtpRestPassword', data: {
        'email': userEntity.email,
      });
      log(response.data.toString());
      if (response.statusCode == 200) {
        return right(RegisterModel.fromJson(response.data));
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (e) {
      return left(ServerFailure(UnexpectedError().message));
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> forgotPassConfirmotp(
      RegisterModel userEntity, String otpCode) async {
    try {
      // استرجاع قيمة الـ RegisterModel مباشرة بدلاً من مسحها قبل استخدامها
      var registerModel = globalModel.getRegisterModel();
      if (registerModel == null) {
        return left(ServerFailure("Register model is not set"));
      }
      log(registerModel.email.toString());
      var response = await dioHelper.postData(
        url: '/api/Account/verifyOtpForgetPassword',
        data: {
          'email': registerModel.email,
          'otp': otpCode.toString(),
        },
      );
      if (response.statusCode == 200) {
        return right(RegisterModel.fromJson(response.data));
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (e) {
      return left(ServerFailure(UnexpectedError().message));
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> confermPassword(
      RegisterModelinp userEntity) async {
    try {
      var registerModel = globalModel.getRegisterModel();
      if (registerModel == null) {
        return left(ServerFailure("Register model is not set"));
      }
      var response = await dioHelper
          .postData(url: '/api/Account/resetForgetPassword', data: {
        'email': userEntity.email,
        'token': registerModel.resetPasswordToken,
        'newPassword': userEntity.password,
        'confirmPassword': userEntity.confPass
      });
      log(response.data.toString());
      if (response.statusCode == 200) {
        return right(RegisterModel.fromJson(response.data));
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (e) {
      return left(ServerFailure(UnexpectedError().message));
    }
  }
}
