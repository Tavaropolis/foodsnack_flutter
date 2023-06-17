import 'package:flutter/material.dart';

class MensagemCarrinho extends StatelessWidget {
  const MensagemCarrinho({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Você ainda não adicionou itens no carrinho 😊",
      style: TextStyle(color: Colors.white, fontFamily: "DancingScript", fontSize: 20),),
    );
  }
}