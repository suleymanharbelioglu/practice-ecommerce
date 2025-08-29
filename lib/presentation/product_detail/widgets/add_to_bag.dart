import 'package:flutter/material.dart';
import 'package:practice_ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:practice_ecommerce/domain/product/entity/color.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;

  const AddToBag({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BasicReactiveButton(
        onPressed: () {},
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14,
              ),
            ),

            const Text(
              'Add to Bag',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
