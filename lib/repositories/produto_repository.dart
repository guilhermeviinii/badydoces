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
      'https://backend-badydoces.herokuapp.com/new-product',
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

  Future<void> delete(String id) async {
    var response = await http
        .delete("https://backend-badydoces.herokuapp.com/delete-product/$id");
    if (response.statusCode == 200) {
      this.products.removeWhere((product) => product.id == id);
      notifyListeners();
    }
  }

  Future<void> update(Product product) async {
    print(product.id);
    var response = await http.put(
        "https://backend-badydoces.herokuapp.com/update-product/${product.id}",
        body: jsonEncode(product.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      print(product.id);
      int index = this.products.indexWhere((p) => p.id == product.id);
      this.products[index] = product;
      notifyListeners();
    }
  }
}
