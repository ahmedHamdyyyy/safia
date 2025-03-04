import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';
import 'package:safiaa/features/orders/data/models/copouns_model.dart';
import 'package:safiaa/features/orders/domain/repositories/copouns_repo.dart';

part 'copoun_state.dart';

class CopounCubit extends Cubit<CopounState> {
  CopounCubit(this.getCopounsRepo) : super(CopounInitial());
  final CopounsRepo getCopounsRepo;
  Future<void> getCopouns(String copoun) async {
    emit(CopounLoading());

    final Either<Failure, OrderResponse> result =
        await getCopounsRepo.getCopouns(copoun);
    result.fold(
      (failure) => emit(CopounError(failure.message)),
      (copoun) => emit(CopounLoaded(copoun)),
    );
  }
}
