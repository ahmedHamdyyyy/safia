import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';
import 'package:safiaa/features/profile/data/models/profile_model.dart';
import 'package:safiaa/features/profile/domain/repositories/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());

    final Either<Failure, ProfileModel> result = await profileRepo.getUserById();

    result.fold(
      (failure) => emit(ProfileError(message: _mapFailureToMessage(failure))),
      (profile) => emit(ProfileLoaded(profileModel: profile)),
    );
  }
  //get all orders
  Future<void> getOrders() async {
    emit(OrdersLoading());

    final Either<Failure, List<OrderResponse>> result =
        await profileRepo.updateProfile();

    result.fold(
      (failure) => emit(OrdersError(message: _mapFailureToMessage(failure))),
      (orders) => emit(OrdersLoaded(orders: orders)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    // تحويل الخطأ إلى رسالة مفهومة
    if (failure is ServerFailure) {
      return failure.message ?? 'An error occurred. Please try again later.';
    } else {
      return 'Unexpected error occurred.';
    }
  }

   Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    var response = await profileRepo.deleteAccount();
    response.fold(
      (l) => emit(DeleteAccountError(message: _mapFailureToMessage(l))),
      (r) => emit(DeleteAccountLoaded()),
    );
  }
}
