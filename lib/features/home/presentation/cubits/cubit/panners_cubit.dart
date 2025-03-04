import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/home/domain/repositories/panners_repo.dart';
import 'package:safiaa/features/home/data/models/panner/panner.dart';
import 'package:safiaa/features/home/presentation/cubits/cubit/panners_state.dart';

class PannersCubit extends Cubit<PannersState> {
  final PannerRepository repository;

  PannersCubit(this.repository) : super(PannersInitial());

  Future<void> fetchBanners() async {
    emit(PannersLoading());
    final Either<Failure, List<PannersModel>> result = await repository.fetchBanners();
    result.fold(
      (failure) => emit(PannersError(failure.message)),
      (banners) => emit(PannersLoaded(banners)),
    );
  }
}
