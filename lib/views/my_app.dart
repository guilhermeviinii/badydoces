import 'package:badydoces/views/tela_inicial.dart';
import 'package:badydoces/views/tela_novaVenda.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => TelaInicial(),
        '/nova_venda': (context) => TelaNv(),
      },
      initialRoute: '/',
    );
  }
}
