import 'package:flutter/material.dart';
import 'package:practice_ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:practice_ecommerce/domain/order/entity/product_ordered.dart';
import 'package:practice_ecommerce/presentation/settings/wigets/order_item_card.dart';

class OrderItemsPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;

  const OrderItemsPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text(
          'Order Items'
        ),
      ),
      body: _products()
    );
  }

    Widget _products() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return OrderItemCard(
          productOrderedEntity: products[index] ,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10,),
      itemCount: products.length
    );
  }
}