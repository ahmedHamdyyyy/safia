import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/cart/data/models/cart_model.dart';

abstract class CartRepo {
  // abstract methods without body whit dartz geting cart model by usung id
  Future<Either<Failure, CartModel>> getCartById();
  // abstract methods without body whit dartz to add item to cart
  Future<Either<Failure, CartModel>> addItemToCart(int productId, int quantity);
  // abstract methods without body whit dartz to remove item from cart
  Future<Either<Failure, CartModel>> removeItemFromCart(int productId);
}

