import 'dart:html';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset('images/LOGO.png'),
                      decoration: BoxDecoration(),
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: MyStatefulWidget(),
                  ))
            ],
          ),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Usuário',
            ),
            validator: (String value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira seu usuário';
              }
              return null;
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Senha',
              ),
              validator: (String value) {
                print(value);
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua senha';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                      shadowColor: Colors.black54,
                      elevation: 4,
                    ),
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // Process data.
                      }
                    },
                    child: const Text('Entrar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
