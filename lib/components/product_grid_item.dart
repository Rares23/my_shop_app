import 'package:flutter/material.dart';
import 'package:my_shop_app/data/models/product.dart';
import 'package:my_shop_app/data/providers/cart_provider.dart';
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

  void _addProductToCart(
    CartProvider cartProvider,
    String id,
    String title,
    double price,
  ) {
    cartProvider.addItem(id, price, title);
  }

  void _undoAddProductAction(
    CartProvider cartProvider,
    String productId,
  ) {
    cartProvider.removeSingleItem(productId);
  }

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

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
            leading: Consumer<Product>(
              builder: (context, value, child) => IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  product.changeFavoriteState(!product.isFavorite);
                },
              ),
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
              onPressed: () {
                _addProductToCart(
                  cartProvider,
                  product.id,
                  product.title,
                  product.price,
                );

                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("Product \"${product.title}\" added!"),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          _undoAddProductAction(cartProvider, product.id);
                        },
                      )),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
