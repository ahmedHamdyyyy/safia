import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiaa/core/helpers/build_error_bar.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/widgets/custom_progress_hud.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';
import 'package:safiaa/features/orders/presentation/cubit/add_order_cubit.dart';
import 'package:safiaa/features/orders/presentation/widgets/add_order_view_body.dart';

class AddOrderViewBodyBlocCons extends StatelessWidget {
  const AddOrderViewBodyBlocCons({super.key,});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          context.pushReplacementNamed(orderDetailsView,
              arguments: state.order);
        } else if (state is AddOrderError) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is AddOrderLoading ? true : false,
            child: const AddOrderViewBody());
      },
    );
  }
}
