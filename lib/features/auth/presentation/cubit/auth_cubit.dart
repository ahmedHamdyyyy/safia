import 'dart:developer';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:safiaa/core/recourses/global_model.dart';
import 'package:safiaa/features/auth/data/models/log_model.dart';
import 'package:safiaa/features/auth/data/models/register_model.dart';
import 'package:safiaa/features/auth/data/repositrie/user_repos.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/features/auth/data/models/guest_user_model.dart';
import 'package:safiaa/core/widgets/wave_loading_animation.dart';
import 'package:safiaa/core/widgets/success_dialog.dart';

import '../../../../core/helpers/build_error_bar.dart';
import '../../../../core/recourses/routes_manger/const.dart';
import '../../../../main.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserRepo userRepo;
  AuthCubit({required this.userRepo}) : super(AuthInitial());

  Future<void> userLogin(LogModel userEntity) async {
    emit(AuthLoading());
    
    // Add a minimum delay to show loading animation
    await Future.delayed(const Duration(seconds: 2));
    
    var response = await userRepo.userLogin(userEntity);
    log(response.toString());
    response.fold(
      (l) => emit(AuthError(l.message)),
      (r) {
        // Save token
        Shareds.setString('token', r.token ?? '');
        emit(AuthSuccess());
      },
    );
  }

  Future<void> userRegister(RegisterModelinp userEntity) async {
    emit(AuthLoading());
    var response = await userRepo.userRegister(userEntity);
    response.fold(
      (l) => emit(AuthError(l.message)),
      (r) {
        GlobalModel().setRegisterModel(r);
        emit(AuthSuccess());
      },
    );
  }

  Future<void> confirmOtp(String otpCode) async {
    emit(AuthLoading());

    // Retrieve the register model from the global state
    final registerModel = GlobalModel().getRegisterModel();
    if (registerModel == null) {
      emit(AuthError("Register model is not set"));
      return;
    }

    // Call the repository method for OTP confirmation
    try {
      var response = await userRepo.userConfirmotp(registerModel, otpCode);
      response.fold(
        (l) => emit(AuthError(l.message )),
        (r) {
          GlobalModel()
              .setRegisterModel(r); // Update the global model if needed
          emit(AuthOtpConfirmed());
          GlobalModel().clearRegisterModel();
        },
      );
    } catch (e) {
      emit(AuthError("Error: ${e.toString()}"));
    }
  }
  Future<void> confermPassword(RegisterModelinp userEntity) async {
     emit(AuthLoading());

    // Retrieve the register model from the global state
    final registerModel = GlobalModel().getRegisterModel();
    if (registerModel == null) {
      emit(AuthError("Register model is not set"));
      return;
    }

    // Call the repository method for OTP confirmation
    try {
      var response = await userRepo.confermPassword(userEntity);
      response.fold(
        (l) => emit(AuthError(l.message)),
        (r) {
          GlobalModel()
              .setRegisterModel(r); // Update the global model if needed
          emit(SendOtpToMailStepThree());
          GlobalModel().clearRegisterModel();
        },
      );
    } catch (e) {
      emit(AuthError("Error: ${e.toString()}"));
    }
  }

  Future<void> forgetPassword(RegisterModelinp userEntity) async {
    emit(AuthLoading());

    try {
      var response = await userRepo.forgetPassword(userEntity);
      response.fold(
        (l) => emit(AuthError(l.message)),
        (r) {
          GlobalModel().setRegisterModel(r);
          emit(SendOtpToMailStepOne());

        },
      );
    } catch (e) {
      emit(AuthError("Error: ${e.toString()}"));
    }
  }

  Future<void> forgotPassConfirmotp(String otp) async {
    emit(AuthLoading());

    final registerModel = GlobalModel().getRegisterModel();
    print("RegisterModel before API call: ${registerModel?.toJson()}");

    if (registerModel == null) {
      emit(AuthError("Register model is not set"));
      return;
    }

    try {
      var response = await userRepo.forgotPassConfirmotp(registerModel, otp);
      response.fold(
        (l) => emit(AuthError(l.message)),
        (r) {
          GlobalModel().setRegisterModel(r);
          emit(SendOtpToMailStepTwo());
        },
      );
    } catch (e) {
      emit(AuthError("Error: ${e.toString()}"));
    }
  }

  Future<void> loginAsGuest() async {
    try {
      emit(AuthLoading());
      
      // Set guest user status
      Shareds.setGuestUser(true);
      
      // Emit success state
      emit(AuthSuccess());
      
      // Navigate to home view
      navigateToHome();
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void navigateToHome() {
    // Use static navigation or get the navigator context from somewhere else
    navigatorKey.currentState?.pushReplacementNamed(homeView);
  }

  Future<void> checkAuthStatus() async {
    try {
      emit(AuthLoading());
      
      final token = Shareds.getString('token');
      final isGuest = Shareds.getBool('isGuestUser');

      if (token.isNotEmpty || isGuest) {
        // User is either logged in or guest
        emit(AuthSuccess());
        return;
      }
      
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError('Error checking auth status: ${e.toString()}'));
    }
  }

  Future<void> logoutUser() async {
    emit(AuthLoading());
    try {
      // Clear token and other user data
      await Shareds.clear();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError('Failed to logout: ${e.toString()}'));
    }
  }

  Future<void> login(BuildContext context) async {
    // Show loading dialog with wave animation
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const WaveLoadingAnimation(),
    );

    try {
      // Your existing login logic here
      // ...

      // On success:
      Navigator.pop(context); // Dismiss loading dialog
      
      // Show success dialog
      await showDialog(
        context: context,
        builder: (context) => SuccessDialog(
          message: 'تم تسجيل الدخول بنجاح',
          onDismiss: () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, homeView);
          },
        ),
      );
      
      // When login is successful, make sure to set guest status to false
      Shareds.setGuestUser(false);
      
    } catch (error) {
      // On error:
      Navigator.pop(context); // Dismiss loading dialog
      buildErrorBar(context, error.toString());
    }
  }
}
