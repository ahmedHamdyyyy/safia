// class get Categories repo implementation

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/exception.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/core/helpers/api_services.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/features/products/data/models/categories.dart';
import 'package:safiaa/features/products/domain/repositories/categories_rep.dart';

class CategoriesRepoImp implements CategoriesRep {
  final DioHelper dioHelper;

  CategoriesRepoImp(this.dioHelper);
  
  @override
  Future<Either<Failure, List<Categories>>> getCategories() async{
    try {
      final response = await dioHelper.getData(url: '/api/Categories');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final categories =
            data.map((categorie) => Categories.fromJson(categorie)).toList();
        return Right(categories);
      } else {
        return Left(
            ServerFailure('Failed to load categories: ${response.statusCode}'));
      }
    } catch (e) {
      log('Error fetching categories: $e');
      return Left(ServerFailure(UnexpectedError().message));
    }
  }
  
  @override
  Future<Either<Failure, List<Products>>> getProducts() async{
   try {
      final response = await dioHelper.getData(url: '/api/Product?pageNumber=1&pageSize=1000');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['items'];
        final products =
            data.map((categorie) => Products.fromJson(categorie)).toList();
        return Right(products);
      } else {
        return Left(
            ServerFailure('Failed to load products: ${response.statusCode}'));
      }
    } catch (e) {
      log('Error fetching products: $e');
      return Left(ServerFailure(UnexpectedError().message));
    }
  }
   @override
  Future<Either<Failure, Products>> addItemToCart(
      int productId, int quantity) async {
       
    try {
      final userId = Shareds.getString(prefsKeyId);
      final response = await dioHelper.postData(
        url: '/api/ShoppingCart/add?userId=$userId&productId=$productId&quantity=$quantity',
        // data: {'productId': productId, 'quantity': quantity, 'cartId': userId},
      );

      if (response.statusCode == 200) {
        final productsAdd = Products.fromJson(response.data);
       
        return Right(productsAdd);
      }else if (response.statusCode == 400)
      {
        return Left(ServerFailure('Failed to load adding cartItems: ${'الكمية المطلوبة غير متوفرة'}'));
      }
       else {
        return Left(
            ServerFailure('Failed to load adding cartItems: ${'حدث خطأ ما'}'));
      }
    } catch (e) {
      log('Error fetching adding cartItems: $e');
      return Left(ServerFailure(UnexpectedError().message));
    }
  }
}
