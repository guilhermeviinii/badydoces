class Product {
  String product_id;
  String name;
  double price;
  int amount;
  String name_category;

  Product(
      {this.product_id,
      this.name,
      this.price,
      this.amount,
      this.name_category});

  Product.fromJson(Map<String, dynamic> json) {
    product_id = json['product_id'];
    name = json['name'];
    price = json['price'];
    amount = json['amount'];
    name_category = json['name_category'];
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': product_id,
      'name': name,
      'price': price,
      'amount': amount,
      'name_category': name_category
    };
  }
}
