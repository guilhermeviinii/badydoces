import 'package:badydoces/models/categoria.model.dart';
import 'package:badydoces/models/produto.model.dart';
import 'package:badydoces/repositories/categoria_repository.dart';
import 'package:badydoces/repositories/produto_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/bottomNaviBar/index.dart';

class TelaNv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var pRepository = Provider.of<ProductRepository>(context);
    // var cRepository = Provider.of<CategoryRepository>(context);

    var dropDownValue = '';
    var dropDownValue2 = '';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Nova venda'),
      ),
      bottomNavigationBar: BottomNaviBar(),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Flexible(
      //       flex: 1,
      //       child: Container(
      //         margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
      //         child: Column(
      //           children: [
      //             Row(
      //               children: [
      //                 SizedBox(width: 10),
      //                 Text(
      //                   'Categoria',
      //                   style: TextStyle(
      //                     fontSize: 30,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //                 SizedBox(width: 70),
      //                 Text(
      //                   'Produtos',
      //                   style: TextStyle(
      //                     fontSize: 30,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //                 SizedBox(width: 70),
      //                 Text(
      //                   'Qtd',
      //                   style: TextStyle(
      //                     fontSize: 30,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             SizedBox(height: 10),
      //             Row(
      //               children: [
      //                 SizedBox(width: 10),
      //                 Container(
      //                   padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                   ),
      //                   child: DropdownButton<String>(
      //                     value: dropDownValue,
      //                     dropdownColor: Colors.white,
      //                     icon: const Icon(Icons.arrow_drop_down),
      //                     iconSize: 40,
      //                     isExpanded: false,
      //                     isDense: false,
      //                     style: const TextStyle(color: Colors.black),
      //                     underline: SizedBox(),
      //                     // items: cRepository.categorias
      //                     //     .map<DropdownMenuItem<String>>((Categoria value) {
      //                     //   return DropdownMenuItem<String>(
      //                     //     value: value.name,
      //                     //     child: Text(
      //                     //       value.name,
      //                     //       style: TextStyle(
      //                     //         fontSize: 25,
      //                     //       ),
      //                     //     ),
      //                     //   );
      //                     // }).toList(),
      //                     // onChanged: (String newValue) {
      //                     //   dropDownValue = newValue;
      //                     // },
      //                   ),
      //                 ),
      //                 SizedBox(width: 45),
      //                 Container(
      //                   padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                   ),
      //                   child: DropdownButton<String>(
      //                     value: dropDownValue2,
      //                     dropdownColor: Colors.white,
      //                     icon: const Icon(Icons.arrow_drop_down),
      //                     iconSize: 40,
      //                     isExpanded: false,
      //                     isDense: false,
      //                     style: const TextStyle(color: Colors.black),
      //                     underline: SizedBox(),
      //                     // items: pRepository.products
      //                     //     .map<DropdownMenuItem<String>>((Product value) {
      //                     //   return DropdownMenuItem<String>(
      //                     //     value: value.toString(),
      //                     //     child: Text(
      //                     //       value.toString(),
      //                     //       style: TextStyle(
      //                     //         fontSize: 25,
      //                     //       ),
      //                     //     ),
      //                     //   );
      //                     // }).toList(),
      //                     // onChanged: (String newValue) {
      //                     //   dropDownValue2 = newValue;
      //                     // },
      //                   ),
      //                 ),
      //                 SizedBox(width: 45),
      //                 Flexible(
      //                   flex: 2,
      //                   child: Container(
      //                     child: TextField(
      //                       style: TextStyle(
      //                         fontSize: 25,
      //                         color: Colors.black,
      //                       ),
      //                       decoration: new InputDecoration(
      //                         filled: true,
      //                         fillColor: Colors.white,
      //                         contentPadding: const EdgeInsets.only(
      //                             left: 5.0, bottom: 5.0, top: 1.0),
      //                         focusedBorder: OutlineInputBorder(
      //                           borderSide: new BorderSide(color: Colors.white),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             SizedBox(height: 30),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               children: [
      //                 //SizedBox(width: 400),
      //                 Container(
      //                   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      //                   decoration: BoxDecoration(
      //                       color: Colors.white,
      //                       borderRadius: BorderRadius.circular(50)),
      //                   child: IconButton(
      //                       splashColor: Colors.white,
      //                       iconSize: 30,
      //                       splashRadius: 40,
      //                       icon: Icon(
      //                         Icons.add_shopping_cart,
      //                       ),
      //                       onPressed: () {}),
      //                 )
      //               ],
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //     // Flexible(
      //     //   flex: 1,
      //     //   child: Row(
      //     //     children: [
      //     //       ListView(),
      //     //     ],
      //     //   ),
      //     // )
      //   ],
      // ),
    );
  }
}
