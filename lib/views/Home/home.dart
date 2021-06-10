import 'dart:convert';
import 'package:badydoces/models/produto.model.dart';
import 'package:badydoces/views/auth/AuthController.dart';
import 'package:provider/provider.dart';

import 'package:badydoces/models/admin.model.dart';
import 'package:badydoces/repositories/produto_repository.dart';
import 'package:badydoces/views/Home/home_controller.dart';
import 'package:badydoces/views/Home/widgets/estoque_alerta/estoque_alerta_widget.dart';
import 'package:badydoces/views/Home/widgets/total_vendas_card/total_vendas_card_widget.dart';
import 'package:badydoces/views/components/bottomNaviBar/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/bottomNaviBar/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController homeController = HomeController();
  final AuthController authController = AuthController();

  @override
  void initState() {
    authController.autenticar();
    homeController.fetchProducts();
  }

  Widget build(BuildContext context) {
    HomeController _homeController = Provider.of<HomeController>(context);
    print(_homeController.products);
    AuthController _authController = Provider.of<AuthController>(context);

    List<Product> prodcuts = _homeController.products;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xff71C173),
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
