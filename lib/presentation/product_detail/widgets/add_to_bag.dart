import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ecommerce/domain/product/entity/color.dart';
import 'package:practice_ecommerce/presentation/product_detail/bloc/product_quantity_cubit.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;

  const AddToBag({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ProductQuantityCubit,int>(
                  builder: (context, state) {
                  return Text(
                   "\$",
                   style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14
                  ),
                 );
                }, 
              ),
              const Text(
                 'Add to Bag',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14
                ),
              ),
            ],
          );
  }
}