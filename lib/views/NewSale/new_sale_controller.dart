import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badydoces/views/Home/home_controller.dart';

class NewSaleController extends ChangeNotifier {
  static NewSaleController instance = NewSaleController();
  String select_category;
  String select_product;

  atribuir() {
    notifyListeners();
  }
}
