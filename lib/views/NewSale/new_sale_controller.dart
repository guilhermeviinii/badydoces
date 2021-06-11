import 'package:badydoces/models/categoria.model.dart';
import 'package:badydoces/models/produto.model.dart';
import 'package:badydoces/models/venda.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badydoces/views/Home/home_controller.dart';

class NewSaleController extends ChangeNotifier {
  static NewSaleController instance = NewSaleController();
  Categoria select_category;
  Product select_product;

  Sale fieldsNewSale = Sale();

  atribuir() {
    notifyListeners();
  }
}
