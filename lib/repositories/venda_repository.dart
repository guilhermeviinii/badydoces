import 'package:badydoces/models/admin.model.dart';
import 'package:badydoces/models/venda.model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SaleRepository extends ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Sale> sales = List<Sale>();

  SaleRepository() {
    read();
  }

  Future<bool> create(Sale sale) async {
    final SharedPreferences prefs = await _prefs;
    Admin usuario = Admin.fromJson(jsonDecode(prefs.getString('user')));
    var token = usuario.token;
    var response = await http.post(
      '',
      body: jsonEncode(sale.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
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
    try {
      final SharedPreferences prefs = await _prefs;
      Admin usuario = Admin.fromJson(jsonDecode(prefs.getString('user')));
      var token = usuario.token;
      var response = await http.get(
        'https://backend-badydoces.herokuapp.com/show-sales',
        headers: {
          'Content-type': '	application/json; charset=UTF-8',
          'Authorization': "Bearer $token"
        },
      );
      if (response.statusCode == 200) {
        Iterable sales = jsonDecode(response.body) as List;
        var lista = sales.map((objeto) => Sale.fromJson(objeto));
        this.sales = lista.toList();
        notifyListeners();
      }
    } catch (err) {}
  }

  Future<void> delete(int id) async {
    final SharedPreferences prefs = await _prefs;
    Admin usuario = Admin.fromJson(jsonDecode(prefs.getString('user')));
    var token = usuario.token;
    var response = await http.delete("/$id", headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token"
    });
    if (response.statusCode == 200) {
      this.sales.removeWhere((sale) => sale.idSale == id);
      notifyListeners();
    }
  }

  Future<void> update(Sale sale) async {
    final SharedPreferences prefs = await _prefs;
    Admin usuario = Admin.fromJson(jsonDecode(prefs.getString('user')));
    var token = usuario.token;
    var response = await http.put("/${sale.idSale}",
        body: jsonEncode(sale.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token"
        });
    if (response.statusCode == 200) {
      int index = this.sales.indexWhere((s) => s.idSale == sale.idSale);
      this.sales[index] = sale;
      notifyListeners();
    }
  }
}
