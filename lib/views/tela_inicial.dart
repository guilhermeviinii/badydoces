import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  String image = "assets/images/LOGO.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(-31, 0, 152, 218),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Tela inicial'),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    botao_nv(),
                    SizedBox(
                      height: 20,
                    ),
                    botao_estoque(),
                    SizedBox(
                      height: 20,
                    ),
                    botao_cv(),
                  ],
                ),
              )),
        ],
      ),
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
                  fontSize: 40,
                ),
              ),
              subtitle: Text(
                '\nR\$ 1000,00',
                style: TextStyle(
                  fontSize: 40,
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
                  fontSize: 40,
                ),
              ),
              subtitle: Text(
                '\nPaçoca - 1 unidade',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class botao_nv extends StatelessWidget {
  const botao_nv({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
      textColor: Colors.black,
      height: 80.0,
      color: Colors.white,
      onPressed: () {
        Navigator.of(context).pushNamed('/nova_venda');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.add_box_outlined,
              size: 80,
              color: Colors.black,
            ),
          ),
          Text(
            '   Nova Venda',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class botao_estoque extends StatelessWidget {
  const botao_estoque({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
      textColor: Colors.black,
      height: 80.0,
      color: Colors.white,
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => estoque1()),
        // );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.store_mall_directory_outlined,
              size: 80,
              color: Colors.black,
            ),
          ),
          Text(
            '      Estoque',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class botao_cv extends StatelessWidget {
  const botao_cv({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
      textColor: Colors.black,
      height: 80.0,
      color: Colors.white,
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => estoque1()),
        // );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.monetization_on_outlined,
              size: 80,
              color: Colors.black,
            ),
          ),
          Text(
            '   Ctrl Vendas',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}
