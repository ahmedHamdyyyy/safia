import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/auth/data/models/register_model.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';
import 'package:safiaa/features/profile/data/models/profile_model.dart';

abstract class ProfileRepo {

  // abstract methods without body whit dartz geting cart model by usung id
  Future<Either<Failure, ProfileModel>> getUserById();

  // abstract methods without body whit dartz show all orders by user id
  Future<Either<Failure, List<OrderResponse>>> updateProfile();
    Future<Either<Failure, RegisterModel>> deleteAccount();

  
}