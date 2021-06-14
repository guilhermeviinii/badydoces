class Product {
  String id;
  String name;
  String price;
  int amount;
  // ignore: non_constant_identifier_names
  String name_category;

  // ignore: non_constant_identifier_names
  Product({this.id, this.name, this.price, this.amount, this.name_category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    amount = json['amount'];
    name_category = json['name_category'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id_product': id,
      'name': name,
      'price': price,
      'amount': amount,
      'name_category': name_category
    };
  }
}
