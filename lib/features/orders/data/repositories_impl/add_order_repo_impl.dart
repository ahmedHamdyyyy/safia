// create add order repository implementation

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/exception.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/core/helpers/api_services.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';
import 'package:safiaa/features/orders/domain/repositories/add_order_repo.dart';
import 'package:safiaa/generated/l10n.dart';

class AddOrderRepoImpl implements AddOrderRepo {
  final DioHelper dioHelper;

  AddOrderRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, OrderResponse>> addOrder(
      AddOrderModel addOrderModel) async {
    try {
      
      // save orderid in sherds
     

      var response = await dioHelper.postData(url: '/api/Orders', data: {
        'phoneNumebr': addOrderModel.phoneNumebr,
        'shippingAddress': addOrderModel.shippingAddress,
        'shoppingCartId': addOrderModel.shoppingCartId,
        'userId': addOrderModel.userId,
        'detailedAddress': addOrderModel.detailedAddress,
        'notes': addOrderModel.notes,
      });
      
      if (response.statusCode == 200) {
final respons = OrderResponse.fromJson(response.data);      
Shareds.setString(prefsKeyOrderId, respons.orderId.toString());  
log(Shareds.getString(prefsKeyOrderId));
       

        return right(OrderResponse.fromJson(response.data));
      } else {
        
        return left(ServerFailure(response.data['message']));
      }
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(UnexpectedError().message));
    }
  }
}
