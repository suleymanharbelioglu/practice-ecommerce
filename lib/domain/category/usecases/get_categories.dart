import 'package:dartz/dartz.dart';
import 'package:practice_ecommerce/core/usecase/usecase.dart';
import 'package:practice_ecommerce/domain/category/repository/category.dart';
import 'package:practice_ecommerce/service_locator.dart';

class GetCategoriesUseCase implements UseCase<Either,dynamic> {

  @override
  Future<Either> call({dynamic params}) async {
    return await sl<CategoryRepository>().getCategories();
  }

}