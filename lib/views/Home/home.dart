import 'package:badydoces/views/Home/widgets/estoque_alerta/estoque_alerta_widget.dart';
import 'package:badydoces/views/Home/widgets/total_vendas_card/total_vendas_card_widget.dart';
import 'package:badydoces/views/components/bottomNaviBar/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/bottomNaviBar/index.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Bady Doces',
          style: GoogleFonts.ubuntu(
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 129,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/candy.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment(-0.9, -0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TotalVendasCardWidget(),
                  EstoqueAlertaWidget(),
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
