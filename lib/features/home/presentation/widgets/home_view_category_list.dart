import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/features/home/presentation/widgets/home_product_page.dart';
import 'package:safiaa/features/products/data/models/categories.dart';
import 'package:safiaa/features/products/presentation/cubit/categories/categories_cubit.dart';

class HomeViewCategoryList extends StatelessWidget {
  const HomeViewCategoryList({
    super.key,
    required this.categoriesList,
  });
  final List<Categories> categoriesList;

  @override
  Widget build(BuildContext context) {
    RepositoryProvider.of<CategoriesCubit>(context).fetchCategories();
    return HomeCategoryListItem(categoriesList: categoriesList);
    // return BlocBuilder<CategoriesCubit, CategoriesState>(
    //   builder: (context, state) {
    //     if (state is CategoriesLoading) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (state is CategoriesLoaded) {
    //       final categories = state.categoriesList;
    //       return HomeCategoryListItem(categoriesList: categories);
    //     } else if (state is CategoriesError) {
    //       return Center(child: Text(state.message));
    //     } else {
    //       return Center(child: Text('No data available.'));
    //     }
    //   },
    // );
  }
}

class HomeCategoryListItem extends StatelessWidget {
  const HomeCategoryListItem({super.key, required this.categoriesList});
  final List<Categories> categoriesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.h,
      child: ListView.builder(
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HomeProductListPage(category: categoriesList[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: MyColors.grayscale150,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                    spreadRadius: 2,
                  ),
                ],
                border: Border.all(color: MyColors.prime),
              ),
              height: 150.h,
              width: 100.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      categoriesList[index].image.toString(),
                      width: 100.w,
                      height: 70.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      categoriesList[index].name.toString(),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: getBoldStyle(
                        color: MyColors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  verticalSpace(4)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
