import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiaa/core/helpers/injection_container.dart' as di;
import 'package:safiaa/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safiaa/features/auth/presentation/widgets/signup_veiw_body_bloc_consumer.dart';

class SigupView extends StatelessWidget {
  const SigupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthCubit>(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const Scaffold(
          body: SafeArea(child: SignupViewBodyBlocConsumer()),
        ),
      ),
    );
  }
}
