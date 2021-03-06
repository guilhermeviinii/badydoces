import 'package:badydoces/models/produto.model.dart';
import 'package:badydoces/models/venda.model.dart';
import 'package:badydoces/models/venda_produto.model.dart';
import 'package:badydoces/repositories/produto_repository.dart';
import 'package:badydoces/repositories/venda_produto_repository.dart';
import 'package:badydoces/repositories/venda_repository.dart';
import 'package:google_fonts/google_fonts.dart';
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
    String index;
    Sale vendas = ModalRoute.of(context).settings.arguments;
    var repositorySale = Provider.of<SaleRepository>(context, listen: true);
    var repositorySP =
        Provider.of<SaleProductRepository>(context, listen: true);
    var repositoryProduto =
        Provider.of<ProductRepository>(context, listen: true);
    var infoProd = repositoryProduto.products;
    var sales = repositorySale.sales;
    var itens = repositorySP.salesProducts;
    final _formKey = GlobalKey<FormState>();
    List<Product> produtosCat;

    // for (var i in repositorySale.sales) {
    //   print(i.idProduct);
    // }

//     index = vendas.id_sale;
//     repositorySP.salesProducts.forEach((sale) {
//       repositoryProduto.products.forEach((salesProducts) {
//         if (sale.sale_id == index) {
//           if (salesProducts.id == sale.product_id) {
//             produtosCat.add(salesProducts);
//           }
//         }
//       });
//     });
//
//     for (var n in produtosCat) {
//       print(n.name);
//     }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                enabled: false,
                initialValue: vendas.costumer,
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
                      enabled: false,
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
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      enabled: false,
                      initialValue: DateFormat("dd-MM-yyyy")
                          .format(DateTime.parse(vendas.createdAt)),
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
            Divider(),
//             Expanded(
//               child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 itemCount: produtosCat.length,
//                 itemBuilder: (_, index) {
//                   var product = produtosCat.toList()[index];
//
//                   return Dismissible(
//                     key: Key(product.id),
//                     background: Container(
//                       color: Colors.red,
//                     ),
//                     child: Container(
//                       margin: EdgeInsets.only(left: 30, right: 30, top: 10),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(11.36),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color(0xff71C173),
//                               blurRadius: 2,
//                               offset: Offset(1, 3),
//                             ),
//                           ]),
//                       child: ListTile(
//                         onTap: () {
//                           Navigator.of(context).pushNamed(
//                             '/edit_product',
//                             arguments: product,
//                           );
//                         },
//                         title: Text(
//                           product.name,
//                           style: GoogleFonts.ubuntu(
//                             color: Colors.black,
//                           ),
//                         ),
//                         subtitle: Text(
//                           product.price.toString(),
//                           style: GoogleFonts.ubuntu(
//                             color: Colors.black,
//                           ),
//                         ),
//                         trailing: Container(
//                           width: 20,
//                           child: Row(
//                             children: [
//                               Text(
//                                 product.amount.toString(),
//                                 style: GoogleFonts.ubuntu(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
          ],
        ),
      ),
    );
  }
}
