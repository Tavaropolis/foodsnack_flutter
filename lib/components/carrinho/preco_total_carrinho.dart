import 'package:flutter/material.dart';

//Classes
import '../../classes/carrinho.dart';

class PrecoTotalCarrinho extends StatelessWidget {
  const PrecoTotalCarrinho({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
          "Total: R\$${carrinho.precoTotal.toStringAsFixed(2)}",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "DancingScript",
              fontSize: 35 * MediaQuery.of(context).textScaleFactor)),
    );
  }
}