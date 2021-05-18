import 'package:badydoces/repositories/produto_repository.dart';
import 'package:badydoces/repositories/venda_repository.dart';
import 'package:badydoces/views/tela_inicial.dart';
import 'package:badydoces/views/tela_novaVenda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => TelaInicial(),
          '/nova_venda': (context) => TelaNv(),
        },
        initialRoute: '/',
      ),
    );
  }
}
