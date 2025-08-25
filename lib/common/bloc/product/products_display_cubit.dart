import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ecommerce/common/bloc/product/products_display_state.dart';
import 'package:practice_ecommerce/core/usecase/usecase.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;

  ProductsDisplayCubit({required this.useCase}) : super(ProductsInitialState());

  void displayProducts({dynamic params}) async {
    emit(ProductsLoading());
    var returnedData = await useCase.call(params: params);
    returnedData.fold(
      (error) {
        emit(LoadProdutsFailure());
      },
      (data) {
        emit(ProductsLoaded(products: data));
      },
    );
  }

  void displayInitial() {
    emit(ProductsInitialState());
  }
}
