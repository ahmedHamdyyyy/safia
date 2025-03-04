import 'package:safiaa/features/products/data/models/categories.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Categories> categoriesList;

  CategoriesLoaded(this.categoriesList);
}

class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError(this.message);
}
class SelectedCategoryState extends CategoriesState {
  final Categories selectedCategory;

  SelectedCategoryState(this.selectedCategory);
}
