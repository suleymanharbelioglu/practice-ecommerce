import 'package:practice_ecommerce/domain/product/entity/color.dart';

abstract class ProductsDisplayState {}

class ProductsInitialState extends ProductsDisplayState {}

class ProductsLoading extends ProductsDisplayState {}

class ProductsLoaded extends ProductsDisplayState {
  final List<ProductEntity> products;

  ProductsLoaded({required this.products});
}

class LoadProdutsFailure extends ProductsDisplayState {}
