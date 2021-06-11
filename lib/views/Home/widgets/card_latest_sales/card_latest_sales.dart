import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardLatestSalesWidget extends StatelessWidget {
  const CardLatestSalesWidget({Key key}) : super(key: key);

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
                  'Últimas vendas realizada',
                  style: GoogleFonts.ubuntu(fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
