import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiaa/core/helpers/injection_container.dart' as di;
import 'package:safiaa/core/widgets/custom_app_bar.dart';
import 'package:safiaa/features/products/data/models/categories.dart';
import 'package:safiaa/features/products/domain/repositories/categories_rep.dart';
import 'package:safiaa/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:safiaa/features/products/presentation/widgets/product_card.dart';

class HomeProductListPage extends StatelessWidget {
  final Categories category;

  HomeProductListPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(di.sl<CategoriesRep>())..fetchProducts(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              CustomAppBar(
                title: category.name!,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.92,
                  ),
                  itemCount: category.products!.length,
                  itemBuilder: (context, index) {
                    final product = category.products![index];
                    return ProductsCard(
                      products: product,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
