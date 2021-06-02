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

class _StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    var repository = Provider.of<CategoryRepository>(context, listen: true);

    var categorias = repository.categorias;

    // Future<List<Categoria>> aloamor() async {
    //   var categorias = await repository.read();
    //   //print(categorias);
    //   return categorias;
    // }

    //print(categorias);
    // print(aloamor());
    //aloamor();

    // List<CategoryRepository> categoria;
    // print(repository.categorias);
    var dropValue = "Chocolates";

    return Scaffold(
      appBar: AppBar(
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
          DropdownButton(
            value: dropValue,
            icon: const Icon(
              Icons.arrow_drop_down,
              size: 40,
            ),
            elevation: 16,
            onChanged: (newValue) {
              dropValue = newValue;
            },
            items: categorias.map<DropdownMenuItem<String>>((Categoria value) {
              return DropdownMenuItem<String>(
                value: value.name,
                child: Text(value.name),
              );
            }).toList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
