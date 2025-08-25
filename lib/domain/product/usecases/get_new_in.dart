import 'package:dartz/dartz.dart';
import 'package:practice_ecommerce/core/usecase/usecase.dart';
import 'package:practice_ecommerce/domain/product/repository/product.dart';
import 'package:practice_ecommerce/service_locator.dart';

class GetNewInUseCase implements UseCase<Either,dynamic> {

  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().getNewIn();
  }

}