import 'package:badydoces/main.dart';
import 'package:badydoces/models/categoria.model.dart';
import 'package:badydoces/models/produto.model.dart';
import 'package:badydoces/repositories/categoria_repository.dart';
import 'package:badydoces/repositories/produto_repository.dart';
import 'package:badydoces/views/components/bottomNaviBar/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Stock extends StatefulWidget {
  @override
  _StockState createState() => _StockState();
}

Categoria itemSelecionado;

class _StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    var repositoryCategory =
        Provider.of<CategoryRepository>(context, listen: true);
//     var repositoryProduct =
//         Provider.of<ProductRepository>(context, listen: true);
    var categorias = repositoryCategory.categorias;
    Iterable<Product> produtosCat;
//
//     var produtos = repositoryProduct.products;

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
          'Estoque',
          style: GoogleFonts.ubuntu(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          dropDownCAtegoria(categorias),
          Divider(),
          Expanded(child: Consumer<ProductRepository>(
            builder: (context, value, child) {
              //value.products;
              if (itemSelecionado != null) {
                produtosCat = value.products.where((product) =>
                    product.name_category == itemSelecionado.category_name);
              }
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: (itemSelecionado == null)
                    ? value.products.length
                    : produtosCat.length,
                itemBuilder: (_, index) {
                  var product = (itemSelecionado == null)
                      ? value.products[index]
                      : produtosCat.toList()[index];
                  return Dismissible(
                    key: Key(product.name),
                    background: Container(
                      color: Colors.red,
                    ),
                    onDismissed: (direction) {
                      value.delete(product.id);
                    },
                    confirmDismiss: (direction) {
                      return confirmarExclusao(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 30, right: 30, top: 10, bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.fromBorderSide(
                            BorderSide(color: Colors.blue, width: 2.0)),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/edit_product',
                            arguments: product,
                          );
                        },
                        title: Text(
                          product.name,
                          style: GoogleFonts.ubuntu(
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'R' + product.price.toString(),
                          style: GoogleFonts.ubuntu(
                            color: Colors.black,
                          ),
                        ),
                        trailing: Container(
                          width: 20,
                          child: Row(
                            children: [
                              Text(
                                product.amount.toString(),
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
                },
              );
            },
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 30, bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.all(20),
                    onSurface: Colors.black,
                    textStyle: TextStyle(
                      color: Colors.green[200],
                    ),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/add_product'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Icon(Icons.add_circle),
                      ),
                      Text('Adicionar novo produto'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNaviBar(indexTela: 2),
    );
  }

  Container dropDownCAtegoria(List<Categoria> categorias) {
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
          value: (itemSelecionado == null)
              ? itemSelecionado
              : itemSelecionado.category_name,
          hint: Text(
            'Selecione a categoria',
            style: GoogleFonts.ubuntu(
              color: Colors.black,
            ),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            size: 30,
          ),
          isExpanded: true,
          style: TextStyle(color: Colors.black, fontSize: 16),
          items: categorias.map<DropdownMenuItem<String>>((Categoria value) {
            return DropdownMenuItem<String>(
              value: value.category_name,
              child: Text(value.category_name),
            );
          }).toList(),
          onChanged: (var newValue) {
            setState(() {
              itemSelecionado =
                  categorias.firstWhere((cat) => cat.category_name == newValue);
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
          title: Text("Item excluido"),
          actions: [
            FlatButton(
              child: Text("Ok"),
              onPressed: () async {
                await Provider.of<ProductRepository>(context, listen: true)
                    .read();
                Navigator.of(context).pushNamed('/estoque');
              },
            ),
            FlatButton(
              child: Text("Cancelar"),
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
