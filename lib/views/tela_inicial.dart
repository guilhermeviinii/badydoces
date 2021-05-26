import 'package:flutter/material.dart';

import 'components/bottomNaviBar/index.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(-31, 0, 152, 218),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Bady Doces'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          card_vendas(),
          card_produtos(),
          Flexible(
              flex: 4,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(),
              )),
        ],
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}

/////////////////////////////////////////////////////// botoes e cards ///////////////////////////////////////////////////////////////

class card_vendas extends StatelessWidget {
  const card_vendas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Column(
          children: <Widget>[
            const ListTile(
              leading: Icon(
                Icons.calendar_today,
                size: 30,
                color: Colors.red,
              ),
              title: Text(
                'Total de vendas',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              subtitle: Text(
                '\nR\$ 1000,00',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class card_produtos extends StatelessWidget {
  const card_produtos({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Column(
          children: <Widget>[
            const ListTile(
              leading: Icon(
                Icons.warning_amber_rounded,
                size: 40,
                color: Colors.red,
              ),
              title: Text(
                'Produtos acabando',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              subtitle: Text(
                '\nPaçoca - 1 unidade',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
