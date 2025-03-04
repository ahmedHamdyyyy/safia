part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final ProfileModel profileModel;
  ProfileLoaded({required this.profileModel});
}

final class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});
}

//loding
final class ProfileLoading extends ProfileState {}

//all get orders state
final class OrdersLoaded extends ProfileState {
  final List<OrderResponse> orders;
  OrdersLoaded({required this.orders});
}

final class OrdersError extends ProfileState {
  final String message;
  OrdersError({required this.message});
}

//loding
final class OrdersLoading extends ProfileState {}

// delete account state
final class DeleteAccountLoaded extends ProfileState {

}

final class DeleteAccountError extends ProfileState {
  final String message;
  DeleteAccountError({required this.message});
}

final class DeleteAccountLoading extends ProfileState {}



