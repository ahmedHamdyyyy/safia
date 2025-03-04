
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/exception.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/core/helpers/api_services.dart';
import 'package:safiaa/features/home/data/models/panner/panner.dart';
import 'package:safiaa/features/home/domain/repositories/panners_repo.dart';

class PannerRepositoryImpl implements PannerRepository {
  final DioHelper dioHelper;

  PannerRepositoryImpl(this.dioHelper);

  @override
  Future<Either<Failure, List<PannersModel>>> fetchBanners() async {
    try {
      final response = await dioHelper.getData(url: '/api/Panners');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final banners =
            data.map((banner) => PannersModel.fromJson(banner)).toList();
        return Right(banners);
      } else {
        return Left(
            ServerFailure('Failed to load banners: ${response.statusCode}'));
      }
    } catch (e) {
      log('Error fetching banners: $e');
      return Left(ServerFailure(UnexpectedError().message));
    }
  }
}
