import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:safiaa/features/products/presentation/widgets/products_grid.dart';
import 'package:safiaa/features/products/data/models/categories.dart';

class GuestUserHomeBody extends StatelessWidget {
  const GuestUserHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Icon(
                  Icons.person_outline,
                  size: 60,
                  color: MyColors.blue500,
                ),
                const SizedBox(height: 16),
                Text(
                  'مرحباً بك كزائر',
                  style: getBoldStyle(
                    color: MyColors.blue500,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'يمكنك تصفح المنتجات والعروض',
                  style: getRegularStyle(
                    color: MyColors.grayscale600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          // Products Grid
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductsLoaded) {
                return ProductsGrid(products: state.products);
              } else if (state is ProductsError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
} 