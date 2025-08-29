import 'package:practice_ecommerce/data/order/model/product_ordered.dart';
import 'package:practice_ecommerce/domain/order/entity/product_ordered.dart';

class OrderRegistrationReq {
  final List<ProductOrderedEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;

  OrderRegistrationReq(
      {required this.products,
      required this.createdDate,
      required this.itemCount,
      required this.totalPrice,
      required this.shippingAddress});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((e) => e.fromEntity().toMap()).toList(),
      'createdDate': createdDate,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress
    };
  }
}