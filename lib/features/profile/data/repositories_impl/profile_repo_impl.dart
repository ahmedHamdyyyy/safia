import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/exception.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/core/helpers/api_services.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/features/auth/data/models/register_model.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';
import 'package:safiaa/features/profile/data/models/profile_model.dart';
import 'package:safiaa/features/profile/domain/repositories/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final DioHelper dioHelper;

  ProfileRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, ProfileModel>> getUserById() async {
    try {
      final id = Shareds.getString(prefsKeyId);

      // استدعاء API للحصول على بيانات المستخدم
      final response = await dioHelper.getData(url: '/api/Account/$id');

      if (response.statusCode == 200) {
        final data = response.data;
        final profile = ProfileModel.fromJson(data);
        return Right(profile);
      } else {
        return Left(ServerFailure(
            'Failed to load user profile: ${response.statusCode}'));
      }
    } catch (e) {
      log('Error fetching user profile: $e');
      return Left(ServerFailure(UnexpectedError().message));
    }
  }

  @override
  Future<Either<Failure, List<OrderResponse>>> updateProfile() async{
      try {
      final response = await dioHelper.getData(url: '//api/Orders/user/${Shareds.getString(prefsKeyId)}');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final orders =
            data.map((orders) => OrderResponse.fromJson(orders)).toList();
        return Right(orders);
      } else {
        return Left(
            ServerFailure('Failed to load orders: ${response.statusCode}'));
      }
    } catch (e) {
      log('Error fetching orders: $e');
      return Left(ServerFailure(UnexpectedError().message));
    }
  }
@override
Future<Either<Failure, RegisterModel>> deleteAccount()async {
     String userId = Shareds.getString(prefsKeyId);
    
    try {

      final response = await dioHelper.postData(url: '/api/Account/DeleteAccount?userId=$userId', );
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
