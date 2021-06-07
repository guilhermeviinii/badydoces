import 'dart:convert';

import 'package:badydoces/models/admin.model.dart';
import 'package:badydoces/models/categoria.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CategoryRepository extends ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Categoria> categorias = List<Categoria>();

  CategoryRepository() {
    read();
  }

  Future<bool> create(Categoria categoria) async {
    var response = await http.post(
      '',
      body: jsonEncode(categoria.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Categoria categoria = Categoria.fromJson(jsonDecode(response.body));
      this.categorias.add(categoria);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> read() async {
    final SharedPreferences prefs = await _prefs;
    Admin usuario = Admin.fromJson(jsonDecode(prefs.getString('user')));
    var token = usuario.token;
    var response = await http.get(
      'https://backend-badydoces.herokuapp.com/show-category',
      headers: {
        'Content-type': '	application/json; charset=utf-8',
        'Authorization': "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      Iterable products = jsonDecode(response.body) as List;
      var lista = products.map((objeto) => Categoria.fromJson(objeto));
      this.categorias = lista.toList();
      notifyListeners();
    }
  }

  Future<void> delete(String name) async {
    var response = await http.delete("/$name");
    if (response.statusCode == 200) {
      this.categorias.removeWhere((categoria) => categoria.name == name);
      notifyListeners();
    }
  }

  Future<void> update(Categoria categoria) async {
    var response = await http.put("/${categoria.name}",
        body: jsonEncode(categoria.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      int index = this.categorias.indexWhere((c) => c.name == categoria.name);
      this.categorias[index] = categoria;
      notifyListeners();
    }
  }
}
