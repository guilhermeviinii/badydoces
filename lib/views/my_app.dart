import 'package:badydoces/views/Home/home.dart';
import 'package:badydoces/views/Login/index.dart';
import 'package:badydoces/views/NewSale/new_sale.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Login(),
        '/tela_inicial': (context) => Home(),
        '/nova_venda': (context) => NewSale(),
      },
      initialRoute: '/',
    );
  }
}
