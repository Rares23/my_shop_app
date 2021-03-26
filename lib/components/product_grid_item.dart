import 'package:flutter/material.dart';
import 'package:my_shop_app/screens/product_details_screen.dart';

class ProductGridItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductGridItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  });

  void _openProductDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      ProductDetailsScreen.route,
      arguments: {
        'id': id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GestureDetector(
        onTap: () {
          _openProductDetails(context);
        },
        child: GridTile(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
            title: Text(
              title,
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
