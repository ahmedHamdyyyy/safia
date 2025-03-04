// create copoun repository implementation
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/exception.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/core/helpers/api_services.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';
import 'package:safiaa/features/orders/data/models/copouns_model.dart';
import 'package:safiaa/features/orders/domain/repositories/copouns_repo.dart';

class CopounsRepoImpl implements CopounsRepo {
  final DioHelper dioHelper;

  CopounsRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, OrderResponse>> getCopouns( String copoun) async {
    try {
      final orderId = Shareds.getString(prefsKeyOrderId);
      final response = await dioHelper.getData(url: '/api/Coupons/apply?orderId=$orderId&couponCode=$copoun');
      if (response.statusCode == 200) {
        final respons = response.data;
        log(Shareds.getString(prefsKeyOrderId));

        return right(OrderResponse.fromJson(respons));
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(UnexpectedError().message));
    }
  }
}
