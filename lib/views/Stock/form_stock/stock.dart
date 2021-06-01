import 'package:badydoces/models/categoria.model.dart';
import 'package:badydoces/repositories/categoria_repository.dart';
import 'package:badydoces/views/components/bottomNaviBar/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Stock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var repository = CategoryRepository();

    var dropValue = 1;

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
            items: repository.categorias
                .map<DropdownMenuItem<String>>((Categoria value) {
              return DropdownMenuItem<String>(
                value: value.id,
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
