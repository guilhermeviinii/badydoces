import 'package:badydoces/repositories/categoria_repository.dart';
import 'package:badydoces/repositories/produto_repository.dart';
import 'package:badydoces/views/Home/home.dart';
import 'package:badydoces/views/Home/home_controller.dart';
import 'package:badydoces/views/Login/index.dart';
import 'package:badydoces/views/NewSale/new_sale.dart';
import 'package:badydoces/views/Stock/form_stock/stock.dart';
import 'package:badydoces/views/auth/AuthController.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryRepository>.value(
            value: CategoryRepository()),
        ChangeNotifierProvider<AuthController>.value(value: AuthController()),
        ChangeNotifierProvider<HomeController>.value(value: HomeController()),
        ChangeNotifierProvider<ProductRepository>.value(
            value: ProductRepository()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Login(),
          '/tela_inicial': (context) => Home(),
          '/nova_venda': (context) => NewSale(),
          '/estoque': (context) => Stock(),
        },
        initialRoute: '/',
      ),
    );
  }
}
