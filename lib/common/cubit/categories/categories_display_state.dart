import 'package:ecommerce_clot/domain/categories/entity/category.dart';

abstract class CategoriesDisplayState {}

class CategoriesDisplayLoading extends CategoriesDisplayState {}

class CategoriesDisplayLoaded extends CategoriesDisplayState {
  final List<CategoryEntity> categoryEntity;

  CategoriesDisplayLoaded({required this.categoryEntity});
}

class CategoriesDisplayFailure extends CategoriesDisplayState {}
