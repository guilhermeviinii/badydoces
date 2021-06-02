import 'package:badydoces/views/NewSale/form_new_sale/form_new_sale_widget.dart';
import 'package:badydoces/views/NewSale/product_add/product_add_widget.dart';
import 'package:badydoces/views/components/bottomNaviBar/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          'Nova venda',
          style: GoogleFonts.ubuntu(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          FormNewSaleWidget(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  ProductAddWdiget(),
                  ProductAddWdiget(),
                  ProductAddWdiget(),
                  ProductAddWdiget(),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
