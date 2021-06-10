import 'dart:js';

import 'package:badydoces/models/produto.model.dart';
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
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<NewSaleController>(context);
    ProductRepository _repoProduct = Provider.of<ProductRepository>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.fromBorderSide(
            BorderSide(color: Color(0xFF4360F6), width: 2.0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          hint: Text(widget.label),
          onChanged: (newValue) {
            setState(() {
              if (widget.model == 'category') {
                controller.select_category = newValue;
                _repoProduct.fetchProductByCategory(controller.select_category);
              } else {
                controller.select_product = newValue;
              }
              controller.atribuir();
            });
          },
          value: widget.model == 'category'
              ? controller.select_category
              : controller.select_product,
          items: widget.list.map((e) {
            return DropdownMenuItem<String>(
              value: widget.model == 'category' ? e.category_name : e.id,
              child:
                  Text(widget.model == 'category' ? e.category_name : e.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
