import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/category/models/category.dart';
import 'package:ecommerce_clot/data/category/source/category_firebase_service.dart';
import 'package:ecommerce_clot/domain/category/repository/category_repository.dart';

import 'package:ecommerce_clot/service_locator.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var result =
        await serviceLocator<CategoryFirebaseService>().getCategories();

    return result.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data)
            .map((e) => CategoryModel.fromMap(e).toEntity())
            .toList());
      },
    );
  }
}
