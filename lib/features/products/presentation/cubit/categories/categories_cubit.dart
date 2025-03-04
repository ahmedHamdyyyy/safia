import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:safiaa/core/errors/failures.dart';
import 'package:safiaa/features/products/data/models/categories.dart';
import 'package:safiaa/features/products/domain/repositories/categories_rep.dart';
import 'package:safiaa/features/products/presentation/cubit/categories/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoriesRep) : super(CategoriesInitial());
  final CategoriesRep categoriesRep;

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());

    final Either<Failure, List<Categories>> result =
        await categoriesRep.getCategories();

    result.fold(
      (failure) => emit(CategoriesError(failure.message)),
      (categories) => emit(CategoriesLoaded(categories)),
    );
  }
   void selectCategory(Categories category) {
    emit(SelectedCategoryState(category));
  }
}
