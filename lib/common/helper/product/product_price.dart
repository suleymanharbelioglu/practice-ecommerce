
import 'package:practice_ecommerce/domain/product/entity/color.dart';

class ProductPriceHelper {

 static double provideCurrentPrice(ProductEntity product) {
    return product.discountedPrice != 0 ? 
    product.discountedPrice.toDouble() : 
    product.price.toDouble();
  }

  
}