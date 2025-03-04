import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiaa/core/helpers/build_error_bar.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/core/widgets/custom_progress_hud.dart';
import 'package:safiaa/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safiaa/features/auth/presentation/widgets/login_view_body.dart';

import '../../../../core/recourses/routes_manger/const.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.pushReplacementNamed(homeView);
          Shareds.setBool(isloged, true);
        } else if (state is AuthError) {
          buildErrorBar(context, 'البريد الالكتروني او كلمة المرور غير صحيحة');
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is AuthLoading ? true : false,
            child: const LoginViewBody());
      },
    );
  }
}
