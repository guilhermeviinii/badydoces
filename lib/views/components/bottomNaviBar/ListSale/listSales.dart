import 'package:badydoces/repositories/venda_repository.dart';
import 'package:badydoces/views/components/bottomNaviBar/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ListSales extends StatefulWidget {
  @override
  _ListSalesState createState() => _ListSalesState();
}

var lista2 = [
  'Janeiro',
  'Fevereiro',
  'Março',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro'
];

var selecionado = DateFormat("MMMM", "pt_BR").format(DateTime.now());

class _ListSalesState extends State<ListSales> {
  @override
  Widget build(BuildContext context) {
    var repositorySales = Provider.of<SaleRepository>(context, listen: true);
    var sales = repositorySales.sales;
    var top = selecionado.characters.first.toUpperCase();
    selecionado =
        selecionado.replaceFirst(selecionado.characters.first, top, 0);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
          opacity: .4,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Controle de vendas',
          style: GoogleFonts.ubuntu(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          dropDownCAtegoria(),
          Divider(),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: sales.length,
              // ignore: missing_return
              itemBuilder: (_, index) {
                var vendas = sales[index];
                var selecionado2 = DateFormat("MMMM", "pt_BR")
                    .format(DateTime.parse(vendas.createdAt));
                var top2 = selecionado2.characters.first.toUpperCase();
                selecionado2 = selecionado2.replaceFirst(
                    selecionado2.characters.first, top2, 0);
                if (selecionado == selecionado2) {
                  return Dismissible(
                    key: Key(vendas.costumer),
                    onDismissed: (direction) {
                      repositorySales.delete(vendas.idSale);
                    },
                    confirmDismiss: (direction) {
                      return confirmarExclusao(context);
                    },
                    background: Container(
                      color: Colors.red,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.fromBorderSide(
                            BorderSide(color: Colors.blue, width: 2.0)),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/infosales',
                            arguments: vendas,
                          );
                        },
                        title: Text(
                          vendas.costumer,
                          style: GoogleFonts.ubuntu(
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          vendas.value.toString(),
                          style: GoogleFonts.ubuntu(
                            color: Colors.black,
                          ),
                        ),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              Text(
                                DateFormat("dd-MM-yyyy")
                                    .format(DateTime.parse(vendas.createdAt)),
                                style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNaviBar(indexTela: 3),
    );
  }

//   abrirWhatsApp() async {
//     var whatsappUrl =
//         "whatsapp://send?phone=+5517991986223&text=Olá,tudo bem ?";
//
//     if (await canLaunch(whatsappUrl)) {
//       await launch(whatsappUrl);
//     } else {
//       throw 'Could not launch $whatsappUrl';
//     }
//   }

  Container dropDownCAtegoria() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.fromBorderSide(
            BorderSide(color: Colors.grey[700], width: 2.0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: selecionado,
          icon: Icon(
            Icons.arrow_drop_down,
            size: 30,
          ),
          isExpanded: true,
          style: TextStyle(color: Colors.black, fontSize: 16),
          items: lista2.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              selecionado = newValue;
            });
          },
        ),
      ),
    );
  }

  Future<bool> confirmarExclusao(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("Deseja excluir essa venda?"),
          actions: [
            FlatButton(
              child: Text("Sim"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            FlatButton(
              child: Text("Não"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }
}
