import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/products/data/models/categories.dart';
import 'package:safiaa/features/products/domain/repositories/categories_rep.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRep) : super(ProductsInitial());

  final CategoriesRep productsRep;

  Future<void> fetchProducts() async {
    emit(ProductsLoading());

    final Either<Failure, List<Products>> result =
        await productsRep.getProducts();

    result.fold(
      (failure) => emit(ProductsError(failure.message)),
      (products) => emit(ProductsLoaded(products)),
    );
  }

  Future<void> addItemToCart(int productId, int quantity) async {
    emit(ProductsLoading());
    
    final Either<Failure, Products> result =
        await productsRep.addItemToCart(productId, quantity);

    result.fold(
      (failure) {
        emit(ProductsError(failure.message));
        Fluttertoast.showToast(
          msg: "فشل إضافة المنتج إلى السلة ❌",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
      (product) {
        emit(ProductsAddedToCart(product));

        Fluttertoast.showToast(
          msg: "تمت إضافة المنتج إلى السلة بنجاح ✅",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
    );
  }
}
