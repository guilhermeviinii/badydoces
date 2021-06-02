import 'dart:html';

import 'package:badydoces/models/categoria.model.dart';
import 'package:badydoces/repositories/categoria_repository.dart';
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
    var repository = Provider.of<CategoryRepository>(context, listen: true);

    var categorias = repository.categorias;

    var dropValue = '';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Add TextFormFields and ElevatedButton here.
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Cliente',
                border: OutlineInputBorder(),
              ),

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Container(
              decoration: BoxDecoration(),
              margin: EdgeInsets.only(top: 16),
              width: double.infinity,
              child: DropdownButton(
                  value: dropValue.isNotEmpty ? dropValue : null,
                  hint: Text('Selecione uma categoria'),
                  isExpanded: true,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    size: 40,
                  ),
                  elevation: 16,
                  onChanged: (newValue) {
                    dropValue = newValue;
                  },
                  items: categorias.isNotEmpty ??
                      categorias
                          .map<DropdownMenuItem<String>>((Categoria value) {
                        return DropdownMenuItem<String>(
                          value: value?.name,
                          child: Text(value.name),
                        );
                      }).toList()),
            ),
            Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Produto',
                        border: OutlineInputBorder(),
                      ),

                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 16, left: 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quantidade',
                        border: OutlineInputBorder(),
                      ),

                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
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
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
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
