import 'dart:js';

import 'package:badydoces/models/categoria.model.dart';
import 'package:badydoces/models/produto.model.dart';
import 'package:badydoces/repositories/categoria_repository.dart';
import 'package:badydoces/repositories/produto_repository.dart';
import 'package:badydoces/views/Home/home_controller.dart';
import 'package:badydoces/views/NewSale/new_sale_controller.dart';
import 'package:badydoces/views/Stock/form_stock/stock.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownInputWidget extends StatefulWidget {
  final List list;
  final String label;
  final String model;

  const DropDownInputWidget(
      {Key key, this.list, this.label, @required this.model})
      : super(key: key);

  @override
  _DropDownInputWidgetState createState() => _DropDownInputWidgetState();
}

class _DropDownInputWidgetState extends State<DropDownInputWidget> {
  Product selectedProduct;
  Categoria selectedCategory;
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<NewSaleController>(context);
    ProductRepository _repoProduct = Provider.of<ProductRepository>(context);
    CategoryRepository _repoCategoria =
        Provider.of<CategoryRepository>(context);

    var dropdownButtonCategory = DropdownButton(
      isExpanded: true,
      hint: Text(widget.label),
      onChanged: (value) {
        setState(() {
          this.selectedCategory = value;
        });
        controller.select_category = value;
        _repoProduct
            .fetchProductByCategory(controller.select_category.category_name);
        controller.atribuir();
      },
      value: controller.select_category ?? selectedCategory,
      items: _repoCategoria.categorias.map((e) {
        return DropdownMenuItem<Categoria>(
          value: e,
          child: Text(e.category_name),
        );
      }).toList(),
    );

    var dropdownButtonProduct = DropdownButton<Product>(
      isExpanded: true,
      hint: Text(widget.label),
      onChanged: (newValue) {
        setState(() {
          this.selectedProduct = newValue;
        });
        controller.select_product = newValue;
        controller.atribuir();
      },
      value: (selectedProduct == null) ? selectedProduct : selectedProduct,
      items: _repoProduct.products.map((e) {
        return DropdownMenuItem<Product>(
          value: e,
          child: Text(e.name),
        );
      }).toList(),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.fromBorderSide(
            BorderSide(color: Color(0xFF4360F6), width: 2.0)),
      ),
      child: DropdownButtonHideUnderline(
        child: widget.model == 'category'
            ? dropdownButtonCategory
            : dropdownButtonProduct,
      ),
    );
  }
}
