import 'package:medpack/data/modals/product.dart';

class Order {
  String? status;
  List<OrderItem> items = [];
  Order({this.status, this.items = const []});

  Order.fromJson(dynamic json) {
    status = json['status'];
    items = (json['items'] as List<dynamic>)
        .map((e) => OrderItem.fromJson(e))
        .toList();
  }
}

class OrderItem {
  int? id;
  Product? product;
  int? quantity;
  OrderItem({this.id, this.product, this.quantity});
  OrderItem.fromJson(dynamic json) {
    id = json['id'];
    product = Product.fromJson(json['product']);
    quantity = json['quantity'];
  }
}
