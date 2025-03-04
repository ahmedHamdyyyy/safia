part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<Products> products;
  
  ProductsLoaded(this.products);
}

final class ProductsAddedToCart extends ProductsState {
  final Products product;
  
  ProductsAddedToCart(this.product);
}

final class ProductsError extends ProductsState {
  final String message;
  
  ProductsError(this.message);
} 





