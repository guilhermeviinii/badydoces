import 'package:badydoces/models/categoria.model.dart';
import 'package:badydoces/repositories/categoria_repository.dart';
import 'package:badydoces/views/components/bottomNaviBar/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Stock extends StatefulWidget {
  @override
  _StockState createState() => _StockState();
}

Categoria itemSelecionado;

class _StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    var repository = Provider.of<CategoryRepository>(context, listen: true);
    var categorias = repository.categorias;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
          opacity: .4,
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          'Estoque',
          style: GoogleFonts.ubuntu(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.36),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.grey,
                    offset: Offset(1, 4),
                  ),
                ]),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: (itemSelecionado == null)
                    ? itemSelecionado
                    : itemSelecionado.name,
                hint: Text('Selecione a categoria'),
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                ),
                isExpanded: true,
                style: TextStyle(color: Colors.black, fontSize: 16),
                items:
                    categorias.map<DropdownMenuItem<String>>((Categoria value) {
                  return DropdownMenuItem<String>(
                    value: value.name,
                    child: Text(value.name),
                  );
                }).toList(),
                onChanged: (var newValue) {
                  setState(() {
                    itemSelecionado =
                        categorias.firstWhere((cat) => cat.name == newValue);
                  });
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 2,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11.36),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(1, 3),
                        ),
                      ]),
                  child: ListTile(
                    title: Text('Produto'),
                    subtitle: Text('Preço'),
                    trailing: Container(
                      width: 20,
                      child: Row(
                        children: [
                          Text(
                            '5',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
