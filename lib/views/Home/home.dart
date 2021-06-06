import 'dart:convert';

import 'package:badydoces/models/admin.model.dart';
import 'package:badydoces/views/Home/home_controller.dart';
import 'package:badydoces/views/Home/widgets/estoque_alerta/estoque_alerta_widget.dart';
import 'package:badydoces/views/Home/widgets/total_vendas_card/total_vendas_card_widget.dart';
import 'package:badydoces/views/auth/AuthController.dart';
import 'package:badydoces/views/components/bottomNaviBar/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/bottomNaviBar/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController controller = HomeController();
  @override
  void initState() {
    controller.fetchProducts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Bady Doces logado email',
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
