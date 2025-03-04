import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiaa/core/helpers/injection_container.dart' as di;
import 'package:safiaa/features/products/presentation/cubit/categories/categories_cubit.dart';
import 'package:safiaa/features/products/presentation/widgets/product_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    //  String? categoryId = ModalRoute.of(context)!.settings.arguments as String? ??'';
    return Scaffold(
      body: BlocProvider.value(
        value: di.sl<CategoriesCubit>()..fetchCategories(),
        child: const ProductsViewBody(),
      ),
    );
  }
}
