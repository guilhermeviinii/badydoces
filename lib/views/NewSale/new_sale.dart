import 'package:badydoces/repositories/admin_repository.dart';
import 'package:badydoces/repositories/categoria_repository.dart';
import 'package:badydoces/repositories/produto_repository.dart';
import 'package:badydoces/repositories/venda_repository.dart';
import 'package:badydoces/views/NewSale/new_sale_controller.dart';
import 'package:badydoces/views/NewSale/widgets/product_add/product_add_widget.dart';
import 'package:badydoces/views/auth/AuthController.dart';
import 'package:badydoces/views/components/bottomNaviBar/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'widgets/form_new_sale/form_new_sale_widget.dart';

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
        backgroundColor: Color(0xff26056C),
        title: Text(
          'Nova venda',
          style: GoogleFonts.ubuntu(
            color: Colors.white,
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
                child: Consumer<NewSaleController>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ProductAddWdiget(
                                productAdd: value.products[index],
                                index: index),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [],
                            )
                          ],
                        );
                      },
                      itemCount: value.products.length,
                    );
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                ),
                onPressed: () async {
                  print(Provider.of<NewSaleController>(context, listen: false)
                          .products
                          .length <=
                      0);
                  if (Provider.of<NewSaleController>(context, listen: false)
                          .products
                          .length <=
                      0) {
                    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 3),
                      content: Text(
                        'Nenhum produto adicionado!',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red[400],
                    ));
                    ;
                  }
                  String adminId =
                      Provider.of<AdminRepository>(context, listen: false)
                          .admin
                          .id;
                  await Provider.of<NewSaleController>(context, listen: false)
                      .realizarVenda(adminId);
                  bool created =
                      Provider.of<SaleRepository>(context, listen: false)
                          .createdNewSale;
                  print(created);
                  if (created == true) {
                    Provider.of<NewSaleController>(context, listen: false)
                        .products = [];
                    Navigator.of(context).pushNamed('/listsales');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 5),
                      content: Text(
                        'Não foi possível finalizar a compra, por favor tente novamente mais tarde',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red[400],
                    ));
                  }
                },
                child: Text('Finalizar venda'),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNaviBar(indexTela: 1),
    );
  }
}
