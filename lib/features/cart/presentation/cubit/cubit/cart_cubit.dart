import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/cart/data/models/cart_model.dart';
import 'package:safiaa/features/cart/domain/repositories/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;
  //  CartModel? _cartItems ;
  Future<void> fetchCartItems() async {
    emit(CartLoading());

    final Either<Failure, CartModel> result = await cartRepo.getCartById();
    print('Fetch cart items result: $result'); // Debugging

    result.fold(
      (failure) => emit(CartError(failure.message)),
      (cartItems) => emit(CartLoaded(cartItems)),
    );
  }

  Future<void> addItemToCart(int productId, int quantity) async {
    emit(CartLoading());
    final Either<Failure, CartModel> result =
        await cartRepo.addItemToCart(productId, quantity);
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (cartItems) =>
        emit(CartLoaded(cartItems)),
               
        
    );
  }

  Future<void> removeItemFromCart(int productId) async {
    emit(CartLoading());
    final Either<Failure, CartModel> result =
        await cartRepo.removeItemFromCart(productId);
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (cartItems) => emit(CartLoaded(cartItems)),
    );
  }
}
