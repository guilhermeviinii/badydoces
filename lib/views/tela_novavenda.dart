import 'package:flutter/material.dart';

class TelaNv extends StatefulWidget {
  @override
  _TelaNvState createState() => _TelaNvState();
}

class _TelaNvState extends State<TelaNv> {
  String dropDownValue = "Bala";
  String dropDownValue2 = "Bala 7 Belo";
  String dropDownValue3 = "1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(-31, 0, 152, 218),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Nova venda'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'Categoria',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 70),
                      Text(
                        'Produtos',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 70),
                      Text(
                        'Qtd',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: DropdownButton<String>(
                          value: dropDownValue,
                          dropdownColor: Colors.white,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 40,
                          isExpanded: false,
                          isDense: false,
                          style: const TextStyle(color: Colors.black),
                          underline: SizedBox(),
                          items: <String>['Bala', 'Pirulito', 'Doces']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropDownValue = newValue;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 45),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: DropdownButton<String>(
                          value: dropDownValue2,
                          dropdownColor: Colors.white,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 40,
                          isExpanded: false,
                          isDense: false,
                          style: const TextStyle(color: Colors.black),
                          underline: SizedBox(),
                          items: <String>[
                            'Bala 7 Belo',
                            'Bala Erlan',
                            'Bala Café'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropDownValue2 = newValue;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 45),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: TextField(
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                            decoration: new InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                  left: 5.0, bottom: 5.0, top: 1.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
