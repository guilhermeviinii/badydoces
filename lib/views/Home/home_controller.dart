import 'dart:convert';

import 'package:badydoces/models/admin.model.dart';
import 'package:badydoces/models/produto.model.dart';
import 'package:badydoces/repositories/produto_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final ProductRepository repository = ProductRepository();
  List<Product> products;

  HomeController({ProductRepository productRepository});

  Future<void> fetchProducts() async {
    final SharedPreferences prefs = await _prefs;
    Admin usuario = Admin.fromJson(jsonDecode(prefs.getString('user')));
    await repository.read();
    products = repository.products;
    products.map((e) => print(e.name));
    notifyListeners();
  }
}
