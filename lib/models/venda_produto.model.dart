class SaleProduct {
  String sale_id;
  String product_id;
  int amount;
  double value;
  

  SaleProduct({this.sale_id, this.product_id, this.amount, this.value});

  SaleProduct.fromJson(Map<String, dynamic> json) {
    sale_id = json['sale_id'];
    product_id = json['product_id'];
    amount = json['amount'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    return {
      'sale_id': sale_id,
      'product_id': product_id,
      'amount': amount,
      'value': value
    };
  }
}
