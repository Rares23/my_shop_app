import 'package:flutter/material.dart';
import 'package:my_shop_app/data/models/product.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();

  Product product =
      Product(id: null, title: '', price: 0, description: '', imageUrl: '');

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    bool isValid = _form.currentState.validate();
    if (isValid) {
      _form.currentState.save();
    }
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please fill the title';
                }
                return null; // input is correct
              },
              onSaved: (value) {
                product = Product(
                    title: value,
                    id: product.id,
                    price: product.price,
                    description: product.description,
                    imageUrl: product.imageUrl);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please fill the price';
                }
                return null;
              },
              onSaved: (value) {
                product = Product(
                    title: product.title,
                    id: product.id,
                    price: double.parse(value),
                    description: product.description,
                    imageUrl: product.imageUrl);
              },
              focusNode: _priceFocusNode,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              onFieldSubmitted: (_) {},
              focusNode: _descriptionFocusNode,
              onSaved: (value) {
                product = Product(
                    title: product.title,
                    id: product.id,
                    price: product.price,
                    description: value,
                    imageUrl: product.imageUrl);
              },
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 8, right: 10),
                  child: _imageUrlController.text.isEmpty
                      ? Text('Set Image')
                      : Container(
                          child: Image.network(_imageUrlController.text),
                        ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Image URL',
                    ),
                    maxLines: 3,
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      _saveForm();
                    },
                    controller: _imageUrlController,
                    focusNode: _imageUrlFocusNode,
                    onSaved: (value) {
                      product = Product(
                          title: product.title,
                          id: product.id,
                          price: product.price,
                          description: product.description,
                          imageUrl: value);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
