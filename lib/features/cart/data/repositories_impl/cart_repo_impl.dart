import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/core/helpers/api_services.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/features/cart/data/models/cart_model.dart';
import 'package:safiaa/features/cart/domain/repositories/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final DioHelper dioHelper;

  CartRepoImpl(this.dioHelper);
  @override
  Future<Either<Failure, CartModel>> getCartById() async {
    // implement getCartById
    try {
      final id = Shareds.getString(prefsKeyId);
      final response = await dioHelper.getData(url: '/api/ShoppingCart/$id');
      if (response.statusCode == 200) {

        final cartItems = CartModel.fromJson(response.data);
        Shareds.setInt(prefsKeyCartId, cartItems.cartId!);
        return Right(cartItems);
      } else {
        return Left(
            ServerFailure('Failed to load cartItems: ${response.statusCode}'));
      }
    } catch (e) {
      log('Error fetcuuhing cartItems: $e');
      return Left(ServerFailure('Error fetchinuug cartItems: $e'));
    }
  }

  @override
  Future<Either<Failure, CartModel>> addItemToCart(
      int productId, int quantity) async {
    try {
      final id =
      Shareds.getString(prefsKeyId);
    
      final response = await dioHelper.putData(
        url: '/api/ShoppingCart?cartItemId=$productId&quantity=$quantity&userId=$id',
      );

      if (response.statusCode == 200) {
        // Check if the response contains a message instead of cart data
        if (response.data is Map<String, dynamic> && 
            response.data.containsKey('message')) {
          // Item was removed (quantity = 0), fetch updated cart
          return await getCartById();
        }
        
        final cartItemsadd = CartModel.fromJson(response.data);
        return Right(cartItemsadd);
      } else {
        return Left(
            ServerFailure('Failed to load cartItems: ${response.statusCode}'));
      }
    } catch (e) {
      log('Error fetching cartItems: $e');
      return Left(ServerFailure('Error fetching cartItems: $e'));
    }
  }

  @override
  Future<Either<Failure, CartModel>> removeItemFromCart(int productId) async {
    try {
      final response = await dioHelper.deleteData(
        url: '/api/ShoppingCart/remove/$productId',
      );
      if (response.statusCode == 200) {
        // Check if the response contains a message instead of cart data
        if (response.data is Map<String, dynamic> && 
            response.data.containsKey('message')) {
          // Item was removed, fetch updated cart
          return await getCartById();
        }
        
        final cartItemsremove = CartModel.fromJson(response.data);
        return Right(cartItemsremove);
      } else {
        return Left(
            ServerFailure('Failed to load cartItems: ${response.statusCode}'));
      }
    } catch (e) {
      log('Error fetching cartItems: $e');
      return Left(ServerFailure('Error fetching cartItems: $e'));
    }
  }
}
