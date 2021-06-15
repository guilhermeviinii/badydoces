import 'package:badydoces/repositories/admin_repository.dart';
import 'package:badydoces/repositories/categoria_repository.dart';
import 'package:badydoces/repositories/produto_repository.dart';
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
        automaticallyImplyLeading: false,
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
          ElevatedButton(
            onPressed: () async {
              String adminId =
                  Provider.of<AdminRepository>(context, listen: false).admin.id;
              bool saleSucess =
                  await Provider.of<NewSaleController>(context, listen: false)
                      .realizarVenda(adminId);
              if (saleSucess) {
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
        ],
      ),
      bottomNavigationBar: BottomNaviBar(indexTela: 1),
    );
  }
}
