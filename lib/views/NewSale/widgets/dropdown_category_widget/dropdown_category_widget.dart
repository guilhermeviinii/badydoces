import 'package:badydoces/models/categoria.model.dart';
import 'package:flutter/material.dart';

class DropDownCategoryWidget extends StatefulWidget {
  final String selectedCategory;
  const DropDownCategoryWidget({Key key, @required this.selectedCategory})
      : super(key: key);

  @override
  _DropDownCategoryWidgetState createState() => _DropDownCategoryWidgetState();
}

class _DropDownCategoryWidgetState extends State<DropDownCategoryWidget> {
  var items = ['teste', 'teste2', 'teste3'];

  @override
  Widget build(BuildContext context) {
    String selectedCategory = widget.selectedCategory ?? '';

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
          hint: Text('Selecione uma categoria'),
          onChanged: (value) {},
          value: selectedCategory,
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
