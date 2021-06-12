import 'package:badydoces/models/categoria.model.dart';
import 'package:badydoces/repositories/categoria_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownCategoryWidget extends StatefulWidget {
  final String selectedCategory;
  final List<Categoria> items;
  const DropDownCategoryWidget(
      {Key key, @required this.selectedCategory, this.items})
      : super(key: key);

  @override
  _DropDownCategoryWidgetState createState() => _DropDownCategoryWidgetState();
}

class _DropDownCategoryWidgetState extends State<DropDownCategoryWidget> {
  Categoria selectedCategory;
  List<Categoria> categorias;

  @override
  void initState() {
    selectedCategory = new Categoria(
      category_name: 'Selecione uma categoria',
      id: '0',
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CategoryRepository _repoCategory = Provider.of<CategoryRepository>(context);

    print(_repoCategory.categorias.length > 0);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.fromBorderSide(
            BorderSide(color: Color(0xFF4360F6), width: 2.0)),
      ),
      child: widget.items.length > 0
          ? DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                hint: Text('Selecione uma categoria'),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
                value: selectedCategory,
                items: _repoCategory.categorias.map((e) {
                  return DropdownMenuItem<Categoria>(
                    value: e,
                    child: Text(e.category_name),
                  );
                }).toList(),
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}
