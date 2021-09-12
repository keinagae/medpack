class Product {
  int? id;
  String? name;
  String? description;
  String? image;
  String? status;
  int quantity = 0;
  DateTime? expiryDate;

  Product(
      {this.id,
      this.name,
      this.description,
      this.expiryDate,
      this.image,
      this.status,
      this.quantity = 0});

  Product.fromJson(dynamic data) {
    this.id = data['id'];
    this.name = data['name'];
    this.description = data['description'];
    this.image = data['image'];
    this.status = data['status'];
    this.expiryDate = DateTime.tryParse(data['expiry_date']);
    this.quantity = data['quantity'] ?? 0;
  }
}
