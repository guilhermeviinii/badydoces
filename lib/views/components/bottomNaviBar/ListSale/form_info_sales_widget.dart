import 'package:badydoces/models/venda.model.dart';
import 'package:badydoces/repositories/venda_produto_repository.dart';
import 'package:badydoces/repositories/venda_repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormInfoSalestWidget extends StatefulWidget {
  @override
  _FormInfoSalestWidgetWidgetState createState() =>
      _FormInfoSalestWidgetWidgetState();
}

class _FormInfoSalestWidgetWidgetState extends State<FormInfoSalestWidget> {
  @override
  Widget build(BuildContext context) {
    var repositorySale = Provider.of<SaleRepository>(context, listen: true);
    var repositorySP =
        Provider.of<SaleProductRepository>(context, listen: true);
    var sales = repositorySale.sales;
    var produtos = repositorySP.salesProducts;
    final _formKey = GlobalKey<FormState>();

    Sale vendas = ModalRoute.of(context).settings.arguments;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                initialValue: vendas.customer,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xFF4360F6)),
                    labelText: 'Nome do cliente',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF4360F6), width: 2.0),
                    )),
              ),
            ),
            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      initialValue: vendas.value,
                      decoration: InputDecoration(
                          labelText: 'Valor total',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF4360F6), width: 2.0),
                          )),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Flexible(
                  flex: 5,
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      initialValue: DateFormat("dd-MM-yyyy")
                          .format(DateTime.parse(vendas.created_at)),
                      decoration: InputDecoration(
                          labelText: 'Data',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF4360F6), width: 2.0),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
