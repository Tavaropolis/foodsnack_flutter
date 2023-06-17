import 'package:flutter/material.dart';

class CartaoTitulo extends StatelessWidget {
  const CartaoTitulo({
    super.key,
    required this.nome,
  });

  final String nome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        nome,
        style: TextStyle(
            color: Colors.white, fontFamily: "DancingScript", fontSize: 30 * MediaQuery.of(context).textScaleFactor),
      ),
    );
  }
}