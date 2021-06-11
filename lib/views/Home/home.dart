import 'dart:async';
import 'dart:convert';
import 'package:badydoces/models/produto.model.dart';
import 'package:badydoces/views/Home/widgets/card_latest_sales/card_latest_sales.dart';
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

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController _authController = Provider.of<AuthController>(context);
    _authController.autenticar();

    Widget loading = Center(
      child: CircularProgressIndicator(),
    );
    if (_authController.isLogged == false) {
      Navigator.of(context).pushNamed('/');
    }
    String name = _authController.user.name;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xff71C173),
        title: Text(
          'Logado como $name - Bady Doces',
          style: GoogleFonts.ubuntu(
            color: Colors.black,
          ),
        ),
      ),
      body: _authController.loading && _authController.isLogged == false
          ? loading
          : Column(
              children: [
                Stack(
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
                            SizedBox(
                              height: 32,
                            ),
                            TotalVendasCardWidget(),
                            EstoqueAlertaWidget(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CardLatestSalesWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CardLatestSalesWidget(),
                )
              ],
            ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
