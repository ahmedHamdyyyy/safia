// import 'dart:developer';
// import 'package:flutter_bloc/flutter_bloc.dart';

// /// this class is the app bloc observer
// class AppBlocObserver extends BlocObserver {
//   @override
//   void onCreate(BlocBase<dynamic> bloc) {
//     super.onCreate(bloc);
//     // activeCubits.add(bloc as Cubit<dynamic>);
//     log('onCreate -- ${bloc.runtimeType}');
//   }

//   @override
//   void onEvent(BlocBase<dynamic> bloc, Object? event) {
//     super.onEvent(bloc as Bloc<dynamic, dynamic>, event);
//     log('onEvent -- ${bloc.runtimeType}, $event');
//   }

//   @override
//   void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
//     super.onChange(bloc, change);
//     log('onChange -- ${bloc.runtimeType}, $change');
//   }

//   @override
//   void onTransition(
//     Bloc<dynamic, dynamic> bloc,
//     Transition<dynamic, dynamic> transition,
//   ) {
//     super.onTransition(bloc, transition);
//     log('onTransition -- ${bloc.runtimeType}, $transition');
//   }

//   @override
//   void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
//     log('onError -- ${bloc.runtimeType}, $error');
//     super.onError(bloc, error, stackTrace);
//   }

//   @override
//   void onClose(BlocBase<dynamic> bloc) {
//     super.onClose(bloc);
//     // activeCubits.remove(bloc as Cubit<dynamic>);
//     log('onClose -- ${bloc.runtimeType}');
//   }
// }

// // List<Cubit<dynamic>> activeCubits = [];
