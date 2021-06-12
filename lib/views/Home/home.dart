import 'package:badydoces/models/venda.model.dart';
import 'package:badydoces/repositories/venda_repository.dart';
import 'package:badydoces/views/Home/widgets/card_latest_sales/card_latest_sales.dart';
import 'package:badydoces/views/auth/AuthController.dart';
import 'package:provider/provider.dart';

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
    AuthController _authController =
        Provider.of<AuthController>(context, listen: false);
    _authController.autenticar();
    SaleRepository _vendasRepo = Provider.of<SaleRepository>(context);

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Color(0xff71C173),
          title: Consumer<AuthController>(
            builder: (context, value, child) {
              var userName = value.user.name;
              return Text(
                'Logado como $userName - Bady Doces',
                style: GoogleFonts.ubuntu(
                  color: Colors.black,
                ),
              );
            },
          )),
      body: Column(
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
        ],
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
