import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ecommerce/domain/order/entity/product_ordered.dart';
import 'package:practice_ecommerce/domain/order/usecases/get_cart_products.dart';
import 'package:practice_ecommerce/domain/order/usecases/remove_cart_product.dart';
import 'package:practice_ecommerce/presentation/cart/bloc/cart_product_diplay_state.dart';
import 'package:practice_ecommerce/service_locator.dart';

class CartProductsDisplayCubit extends Cubit<CartProductsDisplayState> {
  CartProductsDisplayCubit(): super(CartProductsLoading());

  void displayCartProducts() async {

   var returnedData = await sl<GetCartProductsUseCase>().call();

    returnedData.fold(
      (error) {
        emit(LoadCartProductsFailure(errorMessage: error));
      },
      (data) {
        emit(CartProductsLoaded(products: data));
      }
    );
  }

  Future<void> removeProduct(ProductOrderedEntity product) async {
   emit(CartProductsLoading());
   var returnedData = await sl<RemoveCartProductUseCase>().call(
    params: product.id
   );

    returnedData.fold(
      (error) {
        emit(LoadCartProductsFailure(errorMessage: error));
      },
      (data) {
        displayCartProducts();
      }
    );
  }
}