import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/auth/data/models/log_model.dart';
import 'package:safiaa/features/auth/data/models/register_model.dart';

abstract class UserRepo {
  Future<Either<Failure, RegisterModel>> userLogin(LogModel userEntity);
  Future<Either<Failure, RegisterModel>> userRegister(
      RegisterModelinp userEntity);
  Future<Either<Failure, RegisterModel>> userConfirmotp(
      RegisterModel userEntity, String otpCode);
  Future<Either<Failure, RegisterModel>> forgotPassConfirmotp(
      RegisterModel userEntity, String otpCode);


  //send email to request iot to get new password
  Future<Either<Failure, RegisterModel>> forgetPassword(RegisterModelinp userEntity);

  Future<Either<Failure, RegisterModel>> confermPassword(
      RegisterModelinp userEntity);

      // delete account by user id 

   

}
