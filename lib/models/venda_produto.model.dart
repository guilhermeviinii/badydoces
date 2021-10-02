import 'package:badydoces/models/produto.model.dart';

class SaleProduct {
  String sale_id;
  List<Product> product_id;
  int qtd;
  double value;

  SaleProduct(
      {this.sale_id,
      this.product_id,
      this.qtd,
      this.value,
      List<Product> idProduct});

  SaleProduct.fromJson(Map<String, dynamic> json) {
    sale_id = json['sale_id'];
    qtd = json['qtd'];
    value = json['value'];
    if (json['product_id'] != null) {
      product_id = <Product>[];
      json['product_id'].forEach((v) {
        product_id.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sale_id'] = this.sale_id;
    data['qtd'] = this.qtd;
    data['value'] = this.value;
    if (this.product_id != null) {
      data['product_id'] = this.product_id.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
