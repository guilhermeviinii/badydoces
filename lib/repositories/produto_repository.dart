import 'package:badydoces/models/produto.model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductRepository extends ChangeNotifier {
  List<Product> products = List<Product>();

  ProductRepository() {
    read();
  }

  Future<bool> create(Product product) async {
    var response = await http.post(
      '',
      body: jsonEncode(product.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Product product = Product.fromJson(jsonDecode(response.body));
      this.products.add(product);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> read() async {
    var response =
        await http.get('https://backend-badydoces.herokuapp.com/show-product');
    if (response.statusCode == 200) {
      Iterable products = jsonDecode(response.body) as List;
      var lista = products.map((objeto) => Product.fromJson(objeto));
      this.products = lista.toList();
      notifyListeners();
    }
  }

  Future<void> delete(int id) async {
    var response = await http.delete("/$id");
    if (response.statusCode == 200) {
      this.products.removeWhere((product) => product.product_id == id);
      notifyListeners();
    }
  }

  Future<void> update(Product product) async {
    var response = await http.put("/${product.product_id}",
        body: jsonEncode(product.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      int index =
          this.products.indexWhere((p) => p.product_id == product.product_id);
      this.products[index] = product;
      notifyListeners();
    }
  }
}
