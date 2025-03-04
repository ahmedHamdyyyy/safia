// create copoun repository
import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';

abstract class CopounsRepo {
  Future<Either<Failure, OrderResponse>> getCopouns( String copoun);
}