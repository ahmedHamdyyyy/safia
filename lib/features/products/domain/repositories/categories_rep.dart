// class get Categories repo 

import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/products/data/models/categories.dart';

abstract class CategoriesRep {
  Future<Either<Failure,List< Categories>>> getCategories();
  Future<Either<Failure, List<Products>>> getProducts();
    Future<Either<Failure, Products>> addItemToCart(int productId, int quantity);

}