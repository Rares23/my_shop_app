import 'package:flutter/material.dart';
import 'package:my_shop_app/data/models/product.dart';
import 'package:my_shop_app/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductGridItem extends StatelessWidget {
  void _openProductDetails(BuildContext context, String id) {
    Navigator.of(context).pushNamed(
      ProductDetailsScreen.route,
      arguments: {
        'id': id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GestureDetector(
        onTap: () {
          _openProductDetails(context, product.id);
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                Icons.favorite,
                color: product.isFavorite ? Colors.red : Colors.white,
              ),
              onPressed: () {
                product.changeFavoriteState(!product.isFavorite);
              },
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
