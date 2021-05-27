import 'package:flutter/material.dart';
import 'components/bottomNaviBar/index.dart';

class TelaNv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Nova venda'),
      ),
      body: FormNewVenda(),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}

class FormNewVenda extends StatefulWidget {
  const FormNewVenda({Key key}) : super(key: key);

  @override
  State<FormNewVenda> createState() => _FormNewVendaState();
}

class _FormNewVendaState extends State<FormNewVenda> {
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
              hintText: 'Enter your email',
              labelText: 'Cliente',
            ),
            validator: (String value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
