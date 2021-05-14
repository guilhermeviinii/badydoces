import 'dart:convert';

import 'package:badydoces/models/venda_produto.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SaleProductRepository extends ChangeNotifier {
  List<SaleProduct> salesProducts = List<SaleProduct>();

  CategoryRepository() {
    read();
  }

  Future<bool> create(SaleProduct saleProduct) async {
    var response = await http.post(
      '',
      body: jsonEncode(saleProduct.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      SaleProduct saleProduct = SaleProduct.fromJson(jsonDecode(response.body));
      this.salesProducts.add(saleProduct);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> read() async {
    var response = await http.get('');
    if (response.statusCode == 200) {
      Iterable salesProducts = jsonDecode(response.body) as List;
      var lista = salesProducts.map((objeto) => SaleProduct.fromJson(objeto));
      this.salesProducts = lista.toList();
      notifyListeners();
    }
  }

  Future<void> delete(String sale_id) async {
    var response = await http.delete("/$sale_id");
    if (response.statusCode == 200) {
      this
          .salesProducts
          .removeWhere((saleProduct) => saleProduct.sale_id == sale_id);
      notifyListeners();
    }
  }
}
