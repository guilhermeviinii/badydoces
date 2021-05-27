import 'package:badydoces/views/Login/index.dart';
import 'package:badydoces/views/tela_inicial.dart';
import 'package:badydoces/views/tela_novavenda.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Login(),
        '/tela_inicial': (context) => TelaInicial(),
        '/nova_venda': (context) => TelaNv(),
      },
      initialRoute: '/',
    );
  }
}
