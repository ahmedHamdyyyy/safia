// view all orders screen
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiaa/core/helpers/injection_container.dart' as di;
import 'package:safiaa/core/widgets/custom_app_bar.dart';
import 'package:safiaa/features/profile/domain/repositories/profile_repo.dart';
import 'package:safiaa/features/profile/presentation/cubits/cubit/profile_cubit.dart';
import 'package:safiaa/features/profile/presentation/widgets/all_orders_view_body.dart';

class AllOrdersView extends StatelessWidget {
  const AllOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileCubit(di.sl<ProfileRepo>())..getOrders(),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  title: 'طلباتي',
                  onPressed: () => Navigator.pop(context),
                ),
                const Expanded(child: AllOrdersBody()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// view all orders body screen
