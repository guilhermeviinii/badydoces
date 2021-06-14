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
    var repositoryProduct =
        Provider.of<ProductRepository>(context, listen: true);
    var categorias = repositoryCategory.categorias;
    Iterable<Product> produtosCat;

    var produtos = repositoryProduct.products;

    if (itemSelecionado != null) {
      produtosCat = repositoryProduct.products.where(
          (product) => product.name_category == itemSelecionado.category_name);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
          opacity: .4,
        ),
        backgroundColor: Color(0xff26056C),
        title: Text(
          'Estoque',
          style: GoogleFonts.ubuntu(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          dropDownCAtegoria(categorias),
          Divider(),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: (itemSelecionado == null)
                ? produtos.length
                : produtosCat.length,
            itemBuilder: (_, index) {
              var product = (itemSelecionado == null)
                  ? produtos[index]
                  : produtosCat.toList()[index];
              return Dismissible(
                key: Key(product.name),
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (direction) {
                  repositoryProduct.delete(product.id);
                },
                confirmDismiss: (direction) {
                  return confirmarExclusao(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11.36),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 2,
                          offset: Offset(1, 3),
                        ),
                      ]),
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
                      product.price.toString(),
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
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Adicionar produtos'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () => Navigator.of(context).pushNamed('/add_product'),
      ),
      bottomNavigationBar: BottomNaviBar(indexTela: 2),
    );
  }

  Container dropDownCAtegoria(List<Categoria> categorias) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.36),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Color(0xff26056C),
              offset: Offset(1, 4),
            ),
          ]),
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
              onPressed: () {
                Navigator.of(context).pop(true);
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
