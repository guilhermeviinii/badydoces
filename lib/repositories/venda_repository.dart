import 'package:badydoces/models/venda.model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SaleRepository extends ChangeNotifier {
  List<Sale> sales = List<Sale>();

  SaleRepository() {
    read();
  }

  Future<bool> create(Sale sale) async {
    var response = await http.post(
      '',
      body: jsonEncode(sale.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Sale sale = Sale.fromJson(jsonDecode(response.body));
      this.sales.add(sale);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> read() async {
    var response = await http.get('');
    if (response.statusCode == 200) {
      Iterable sales = jsonDecode(response.body) as List;
      var lista = sales.map((objeto) => Sale.fromJson(objeto));
      this.sales = lista.toList();
      notifyListeners();
    }
  }

  Future<void> delete(int id) async {
    var response = await http.delete("/$id");
    if (response.statusCode == 200) {
      this.sales.removeWhere((sale) => sale.id_sale == id);
      notifyListeners();
    }
  }

  Future<void> update(Sale sale) async {
    var response = await http.put("/${sale.id_sale}",
        body: jsonEncode(sale.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      int index = this.sales.indexWhere((s) => s.id_sale == sale.id_sale);
      this.sales[index] = sale;
      notifyListeners();
    }
  }
}
