class Product {
  String id;
  String name;
  String price;
  int amount;
  String category;

  Product({this.id, this.name, this.price, this.amount, this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    amount = json['amount'];
    category = json['name_category'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'amount': amount,
      'name_category': category
    };
  }
}
