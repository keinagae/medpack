import 'package:medpack/data/modals/product.dart';

class Cart {
  String? status;
  List<CartItem> items = [];
  Cart();

  Cart.fromJson(dynamic json) {
    status = json['status'];
    items = (json['items'] as List<dynamic>)
        .map((e) => CartItem.fromJson(e))
        .toList();
  }
}

class CartItem {
  int? id;
  Product? product;
  int? quantity;
  CartItem({this.id, this.product, this.quantity});
  CartItem.fromJson(dynamic json) {
    id = json['id'];
    product = Product.fromJson(json['product']);
    quantity = json['quantity'];
  }
}
