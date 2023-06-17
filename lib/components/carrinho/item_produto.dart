import 'package:flutter/material.dart';

//Classes
import '../../classes/produto.dart';

class ItemCarrinho extends StatelessWidget {
  const ItemCarrinho({
    super.key,
    required this.produto,
  });

  final Produto produto;

  @override
  Widget build(BuildContext context) {
    return Text(
        "${produto.nome} : ${produto.quantidade}. Preço: R\$${(produto.preco * produto.quantidade).toStringAsFixed(2)}",
        style: TextStyle(
            color: Colors.white,
            fontFamily: "DancingScript",
            fontSize: 20 * MediaQuery.of(context).textScaleFactor));
  }
}