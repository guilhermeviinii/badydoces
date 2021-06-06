import 'package:badydoces/models/produto.model.dart';
import 'package:badydoces/repositories/produto_repository.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final ProductRepository repository = ProductRepository();
  List<Product> products;

  HomeController() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    await repository.read();
    products = repository.products;
    products.map((e) => print(e.name));
  }
}
