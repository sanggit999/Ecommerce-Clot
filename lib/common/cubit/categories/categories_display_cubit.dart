import 'package:ecommerce_clot/common/cubit/categories/categories_display_state.dart';
import 'package:ecommerce_clot/domain/category/usecase/get_categories.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesDisplayLoading());

  void displayCategories() async {
    var result = await serviceLocator<GetCategoriesUseCase>().call();
    result.fold(
      (error) {
        emit(CategoriesDisplayFailure());
      },
      (data) {
        emit(CategoriesDisplayLoaded(categoryEntity: data));
      },
    );
  }
}
