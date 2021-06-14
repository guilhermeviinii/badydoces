import 'package:badydoces/models/new_sale_model.dart';
import 'package:flutter/material.dart';

class ProductAddWdiget extends StatelessWidget {
  final NewSaleModel productAdd;
  final int index;
  const ProductAddWdiget({Key key, this.productAdd, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.grey,
            offset: Offset(1, 4),
          ),
        ],
        border: Border.fromBorderSide(
          BorderSide(color: Colors.grey),
        ),
      ),
      height: 80,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text('#${index + 1} - ${productAdd.productName}'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Quantidade: ${productAdd.amount}'),
                  ),
                ],
              ),
            ),
            Expanded(child: Divider()),
            // Expanded(child: Text('Valor - 40'))
          ],
        ),
      ),
    );
  }
}
