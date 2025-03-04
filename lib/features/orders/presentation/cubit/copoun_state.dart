part of 'copoun_cubit.dart';

@immutable
sealed class CopounState {}

final class CopounInitial extends CopounState {}

final class CopounLoaded extends CopounState {
  final OrderResponse copoun;
  CopounLoaded(this.copoun);
}

final class CopounError extends CopounState {
  final String message;
  CopounError(this.message);
}

final class CopounLoading extends CopounState {}

