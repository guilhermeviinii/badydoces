import 'package:badydoces/models/venda.model.dart';
import 'package:badydoces/repositories/venda_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CardLatestSalesWidget extends StatelessWidget {
  final Sale items;

  const CardLatestSalesWidget({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Última venda realizada',
                  style: GoogleFonts.ubuntu(
                    fontSize: 20,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<SaleRepository>(builder: (context, saleRepo, child) {
                  if (saleRepo.sales.length < 1) {
                    return CircularProgressIndicator();
                  }
                  List<Widget> items = [];
                  saleRepo.sales.forEach((e) {
                    items.add(Container(
                      padding: EdgeInsets.all(16),
                      child: Card(
                        child: Column(
                          children: [
                            Row(
                              children: [Text('Cliente: ${e.costumer}')],
                            ),
                            Row(
                              children: [
                                Text(DateFormat("'Data da venda:'  dd/MM/yyyy")
                                    .format(DateTime.tryParse(e.createdAt)))
                              ],
                            ),
                            Row(
                              children: [Text('Valor total: ${e.value}')],
                            )
                          ],
                        ),
                      ),
                    ));
                  });
                  return items[0];
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/listsales');
                    },
                    child: Text('Ver todas as vendas'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
