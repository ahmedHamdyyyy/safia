part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class DeleteUser extends AuthState {}

class AuthOtpConfirmed extends AuthState {}

class SendOtpToMailStepOne extends AuthState {}

class SendOtpToMailStepTwo extends AuthState {}

class SendOtpToMailStepThree extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthGuestSuccess extends AuthState {
  final GuestUserModel guestUser;
  AuthGuestSuccess(this.guestUser);
}
