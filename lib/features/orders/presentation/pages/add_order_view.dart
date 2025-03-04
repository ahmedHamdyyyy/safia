import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiaa/core/helpers/injection_container.dart' as di;
import 'package:safiaa/features/orders/domain/repositories/add_order_repo.dart';
import 'package:safiaa/features/orders/presentation/cubit/add_order_cubit.dart';
import 'package:safiaa/features/orders/presentation/widgets/add_order_bloc_con.dart';
import 'package:safiaa/core/widgets/protected_page.dart';

class AddOrderView extends StatelessWidget {
  const AddOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedPage(
      message: 'يجب تسجيل الدخول لإتمام عملية الطلب',
      child: const AddOrderViewContent(),
    );
  }
}

class AddOrderViewContent extends StatelessWidget {
  const AddOrderViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:  AddOrderCubit(di.sl<AddOrderRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: AddOrderViewBodyBlocCons(),
        ),
      ),
    );
  }
}
