import 'dart:html';

import 'package:badydoces/models/categoria.model.dart';
import 'package:badydoces/models/produto.model.dart';
import 'package:badydoces/repositories/categoria_repository.dart';
import 'package:badydoces/repositories/produto_repository.dart';
import 'package:badydoces/views/NewSale/dropdown_input/dropdown_input_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class FormNewSaleWidget extends StatefulWidget {
  @override
  _FormNewSaleWidgetState createState() => _FormNewSaleWidgetState();
}

class _FormNewSaleWidgetState extends State<FormNewSaleWidget> {
// Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    CategoryRepository _repoCategory =
        Provider.of<CategoryRepository>(context, listen: true);
    ProductRepository _repoProduct =
        Provider.of<ProductRepository>(context, listen: true);
    List<Categoria> categorias = _repoCategory.categorias;
    List<Product> products = _repoProduct.products;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Add TextFormFields and ElevatedButton here.
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xFF4360F6)),
                    labelText: 'Cliente',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF4360F6), width: 2.0),
                    )),

                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              margin: EdgeInsets.only(top: 16),
              width: double.infinity,
              child: DropDownInputWidget(
                list: categorias,
                model: 'category',
                label: 'Selecione uma categoria',
              ),
            ),

            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(),
                    margin: EdgeInsets.only(top: 16),
                    width: double.infinity,
                    child: DropDownInputWidget(
                      list: products,
                      model: 'product',
                      label: 'Selecione um produto',
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 16, left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Qtd',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF4360F6), width: 2.0),
                          )),

                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                    ),
                  ),
                )
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  onSurface: Colors.black,
                  textStyle: TextStyle(
                    color: Colors.green[200],
                  ),
                ),
                onPressed: () {
                  // if (_formKey.currentState.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Venda adicionada com sucesso',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ));
                  // }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Icon(Icons.add_circle),
                    ),
                    Text('Adicionar Produto'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
