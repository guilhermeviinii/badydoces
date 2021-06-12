import 'package:flutter/material.dart';

class ProductAddWdiget extends StatelessWidget {
  const ProductAddWdiget({Key key}) : super(key: key);

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
                    child: Text('#1 - Paçoca'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Quantidade: 3'),
                  ),
                ],
              ),
            ),
            Expanded(child: Divider()),
            Expanded(child: Text('Valor - 40'))
          ],
        ),
      ),
    );
  }
}
