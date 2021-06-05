import 'package:badydoces/views/components/bottomNaviBar/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListSales extends StatefulWidget {
  @override
  _ListSalesState createState() => _ListSalesState();
}

var lista = ['Hoje', 'Tudo'];
String selecionado = "Hoje";
final _formKey = GlobalKey<FormState>();

class _ListSalesState extends State<ListSales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
          opacity: .4,
        ),
        backgroundColor: Color(0xff940C0C),
        title: Text(
          'Controle de vendas',
          style: GoogleFonts.ubuntu(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          dropDownCAtegoria(),
          Divider(),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 1,
              itemBuilder: (_, index) {
                return Dismissible(
                  key: _formKey,
                  // background: Container(
                  //   color: Colors.red,
                  // ),
                  child: Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11.36),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 2,
                            offset: Offset(1, 3),
                          ),
                        ]),
                    child: ListTile(
                      // onTap: () {
                      //   Navigator.of(context).pushNamed(
                      //     '/edit_product',
                      //     arguments: product,
                      //   );
                      // },
                      title: Text(
                        "Cliente\n",
                        style: GoogleFonts.ubuntu(
                          color: Colors.black,
                        ),
                      ),

                      subtitle: Text(
                        'Valor - 100,00',
                        style: GoogleFonts.ubuntu(
                          color: Colors.black,
                        ),
                      ),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            Text(
                              '12/03/1998',
                              style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }

  Container dropDownCAtegoria() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.36),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.blue,
              offset: Offset(1, 4),
            ),
          ]),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: selecionado,
          icon: Icon(
            Icons.arrow_drop_down,
            size: 30,
          ),
          isExpanded: true,
          style: TextStyle(color: Colors.black, fontSize: 16),
          items: lista.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              selecionado = newValue;
            });
          },
        ),
      ),
    );
  }
}
