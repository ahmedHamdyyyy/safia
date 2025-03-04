part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

final class CartInitial extends CartState {}
// cart list state

final class CartLoaded extends CartState {
  final CartModel items;
  CartLoaded(this.items);
}

final class CartError extends CartState {
  final String message;
  CartError(this.message);

}

final class CartLoading extends CartState {}

// cart add item state
// final class CartItemAdded extends CartState {
//   final CartModel items;
//   CartItemAdded(this.items);
// }

// final class CartAddItemError extends CartState {
//   final String message;
//   CartAddItemError(this.message);
// }

// final class CartAddItemLoading extends CartState {}





