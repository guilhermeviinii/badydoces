import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'form_edit_product_widget.dart';

class EditProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pushNamed('/estoque'),
        ),
        backgroundColor: Color(0xff940C0C),
        title: Text(
          'Editar produto',
          style: GoogleFonts.ubuntu(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          FormEditProductWidget(),
        ],
      ),
    );
  }
}
