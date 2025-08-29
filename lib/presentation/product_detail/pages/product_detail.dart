import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:practice_ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:practice_ecommerce/domain/product/entity/color.dart';
import 'package:practice_ecommerce/presentation/product_detail/bloc/favorite_icon_cubit.dart';
import 'package:practice_ecommerce/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:practice_ecommerce/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:practice_ecommerce/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:practice_ecommerce/presentation/product_detail/widgets/add_to_bag.dart';
import 'package:practice_ecommerce/presentation/product_detail/widgets/favorite_button.dart';
import 'package:practice_ecommerce/presentation/product_detail/widgets/product_images.dart';
import 'package:practice_ecommerce/presentation/product_detail/widgets/product_price.dart';
import 'package:practice_ecommerce/presentation/product_detail/widgets/product_quantity.dart';
import 'package:practice_ecommerce/presentation/product_detail/widgets/product_title.dart';
import 'package:practice_ecommerce/presentation/product_detail/widgets/selected_color.dart';
import 'package:practice_ecommerce/presentation/product_detail/widgets/selected_size.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductDetailPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductQuantityCubit()),

        BlocProvider(create: (context) => ProductColorSelectionCubit()),
        BlocProvider(create: (context) => ProductSizeSelectionCubit()),
        BlocProvider(create: (context) => ButtonStateCubit()),
        BlocProvider(
          create: (context) =>
              FavoriteIconCubit()..isFavorite(productEntity.productId),
        ),
      ],
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: false,
          action: FavoriteButton(productEntity: productEntity),
        ),
        bottomNavigationBar: AddToBag(productEntity: productEntity),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(productEntity: productEntity),
              const SizedBox(height: 10),
              ProductTitle(productEntity: productEntity),
              const SizedBox(height: 10),
              ProductPrice(productEntity: productEntity),
              const SizedBox(height: 20),
              SelectedSize(productEntity: productEntity),
              const SizedBox(height: 15),
              SelectedColor(productEntity: productEntity),
              const SizedBox(height: 15),
              ProductQuantity(productEntity: productEntity),
            ],
          ),
        ),
      ),
    );
  }
}
