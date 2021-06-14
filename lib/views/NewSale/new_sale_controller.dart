import 'package:badydoces/models/categoria.model.dart';
import 'package:badydoces/models/new_sale_model.dart';
import 'package:badydoces/models/produto.model.dart';
import 'package:badydoces/models/venda.model.dart';
import 'package:badydoces/views/NewSale/new_sale.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badydoces/views/Home/home_controller.dart';

class NewSaleController extends ChangeNotifier {
  static NewSaleController instance = NewSaleController();
  Categoria select_category;
  List<dynamic> products = [];
  List<Categoria> categories;
  List<Sale> newSale;
  Product select_product;

  Sale fieldsNewSale = Sale();

  void addProduct(NewSaleModel product) {
    print(product.amount);
    this.products.add(product);
    notifyListeners();
  }
}
