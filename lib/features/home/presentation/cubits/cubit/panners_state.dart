import 'package:safiaa/features/home/data/models/panner/panner.dart';

abstract class PannersState {}

class PannersInitial extends PannersState {}

class PannersLoading extends PannersState {}

class PannersLoaded extends PannersState {
  final List<PannersModel> panners;

  PannersLoaded(this.panners);
}

class PannersError extends PannersState {
  final String message;

  PannersError(this.message);
}
