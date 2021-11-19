class Product {
  String id;
  String name;
  String price;
  int amount;
  // ignore: non_constant_identifier_names
  String name_category;

  // ignore: non_constant_identifier_names
  Product({this.id, this.name, this.amount, this.name_category, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id_product'];
    name = json['name'];
    amount = json['amount'];
    name_category = json['name_category'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id_product': id,
      'name': name,
      'amount': amount,
      'name_category': name_category,
      'price': price,
    };
  }
}
