import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/home/data/models/panner/panner.dart';

abstract class PannerRepository {
  Future<Either<Failure, List<PannersModel>>> fetchBanners();
}
