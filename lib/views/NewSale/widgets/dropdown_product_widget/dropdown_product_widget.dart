import 'package:badydoces/models/produto.model.dart';
import 'package:flutter/material.dart';

class DropDownProductWidget extends StatelessWidget {
  const DropDownProductWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = ['teste', 'teste2', 'teste3'];

    String selectedProduct;
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
          hint: Text('Selecione o produto'),
          onChanged: (newValue) {},
          value: selectedProduct,
          items: items.map((e) {
            return DropdownMenuItem<dynamic>(
              value: e,
              child: Text(e),
            );
          }).toList(),
        ),
      ),
    );
  }
}
