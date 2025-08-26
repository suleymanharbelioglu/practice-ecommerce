import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice_ecommerce/common/bloc/product/products_display_cubit.dart';
import 'package:practice_ecommerce/common/bloc/product/products_display_state.dart';
import 'package:practice_ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:practice_ecommerce/common/widgets/product/product_card.dart';
import 'package:practice_ecommerce/core/configs/assets/app_vectors.dart';
import 'package:practice_ecommerce/domain/product/entity/color.dart';
import 'package:practice_ecommerce/domain/product/usecases/get_products_by_title.dart';
import 'package:practice_ecommerce/presentation/home/widgets/search_field.dart';
import 'package:practice_ecommerce/service_locator.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(useCase: sl<GetProductsByTitleUseCase>()),
      child: Scaffold(
        appBar: BasicAppbar(
          height: 80,
          title: SearchField()
        ),
        body: BlocBuilder<ProductsDisplayCubit,ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading){
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductsLoaded) {
              return state.products.isEmpty ? _notFound() : _products(state.products);
            }
            return Container();
          },
        ),
      ),
    );
  }

    Widget _notFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppVectors.notFound,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Sorry, we couldn't find any matching result for your Search.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
            ),
          ),
        )
      ],
    );
  }

   Widget _products(List<ProductEntity> products) {
    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(productEntity: products[index]);
        },
    );
  }
}