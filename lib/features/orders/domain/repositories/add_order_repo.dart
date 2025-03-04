// create post order repository
 import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';

abstract class AddOrderRepo {
 Future<Either<Failure, OrderResponse>> addOrder(AddOrderModel addOrderModel);
 }