import 'package:medpack/data/modals/product.dart';

class Order {
  int? id;
  String? status;
  late DateTime createdAt;
  List<OrderItem> items = [];
  Order({this.status, this.id, this.items = const [], DateTime? createdAt}) {
    this.createdAt = createdAt ?? DateTime.now();
  }

  Order.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    items = (json['items'] as List<dynamic>)
        .map((e) => OrderItem.fromJson(e))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
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
