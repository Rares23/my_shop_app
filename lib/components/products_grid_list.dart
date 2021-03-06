import 'package:flutter/material.dart';
import 'package:my_shop_app/components/product_grid_item.dart';
import 'package:my_shop_app/data/models/product.dart';
import 'package:my_shop_app/data/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductsGridList extends StatelessWidget {
  final bool showOnlyFavorites;

  ProductsGridList({@required this.showOnlyFavorites});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final List<Product> loadedProducts = showOnlyFavorites
        ? productsProvider.onlyFavoriteProducts
        : productsProvider.products;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          child: ProductGridItem(),
          value: loadedProducts[index],
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
