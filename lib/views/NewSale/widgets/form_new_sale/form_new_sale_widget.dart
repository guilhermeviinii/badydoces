import 'dart:html';

import 'package:badydoces/models/new_sale_model.dart';
import 'package:badydoces/models/produto.model.dart';
import 'package:badydoces/models/venda.model.dart';
import 'package:badydoces/repositories/admin_repository.dart';
import 'package:badydoces/repositories/categoria_repository.dart';
import 'package:badydoces/repositories/produto_repository.dart';
import 'package:badydoces/views/NewSale/new_sale.dart';
import 'package:badydoces/views/NewSale/new_sale_controller.dart';
import 'package:badydoces/views/NewSale/widgets/dropdown_category_widget/dropdown_category_widget.dart';
import 'package:badydoces/views/NewSale/widgets/dropdown_product_widget/dropdown_product_widget.dart';
import 'package:badydoces/views/auth/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  String selectedCategory;
  @override
  Widget build(BuildContext context) {
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
                onChanged: (value) {
                  Provider.of<NewSaleController>(context, listen: false)
                      .fieldsNewSale
                      .costumer = value;
                },
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xFF4360F6)),
                    labelText: 'Cliente',
                    enabled:
                        Provider.of<NewSaleController>(context, listen: true)
                                    .products
                                    .length >
                                0
                            ? false
                            : true,
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
              child: DropDownCategoryWidget(),
            ),
            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(),
                    margin: EdgeInsets.only(top: 16),
                    width: double.infinity,
                    child: DropDownProductWidget(),
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
                      onChanged: (value) {
                        Provider.of<NewSaleController>(context, listen: false)
                            .fieldsNewSale
                            .value = value;
                      },
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
                  var price;
                  Provider.of<ProductRepository>(context, listen: false)
                      .products
                      .forEach((element) {
                    if (element.id ==
                        Provider.of<NewSaleController>(context, listen: false)
                            .select_product
                            .id) {
                      price = double.tryParse(
                              element.price.replaceAll(new RegExp(r'\$'), ''))
                          .toInt();
                    }
                  });

                  price = price *
                      double.tryParse(Provider.of<NewSaleController>(context,
                                  listen: false)
                              .fieldsNewSale
                              .value)
                          .toInt();
                  print(price);

                  Product newSale = new Product(
                      price: price.toString(),
                      name:
                          Provider.of<NewSaleController>(context, listen: false)
                              .select_product
                              .name,
                      id: Provider.of<NewSaleController>(context, listen: false)
                          .select_product
                          .id,
                      amount: double.tryParse(Provider.of<NewSaleController>(
                                  context,
                                  listen: false)
                              .fieldsNewSale
                              .value)
                          .round());
                  Provider.of<NewSaleController>(context, listen: false)
                      .addProduct(newSale);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
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
