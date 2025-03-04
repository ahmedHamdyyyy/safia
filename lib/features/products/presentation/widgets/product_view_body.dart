import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/widgets/custom_app_bar.dart';
import 'package:safiaa/features/home/presentation/widgets/home_view_category_list.dart';
import 'package:safiaa/features/products/presentation/cubit/categories/categories_cubit.dart';
import 'package:safiaa/features/products/presentation/cubit/categories/categories_state.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({
    super.key,
  });

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    // context.read<ProductCubit>().loadProductsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesError) {
        } else if (state is CategoriesLoaded) {
          final categorie = state.categoriesList;

          return SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(10),
                CustomAppBar(
                  title: "المنتجات",
                ),
                verticalSpace(24),
                // HomeViewCategoryList(),
              ],
            ),
          );
        } else if (state is CategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
