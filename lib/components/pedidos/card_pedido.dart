import 'package:flutter/material.dart';

class CardPedido extends StatelessWidget {
  const CardPedido({
    super.key,
    required this.dataPedido,
    required this.totalPedido,
  });

  final String dataPedido;
  final num totalPedido;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrangeAccent,
      child: ListTile(
        mouseCursor: SystemMouseCursors.click,
        leading: const Icon(Icons.lens),
        title: Text(dataPedido),
        subtitle: Text("R\$ ${totalPedido.toStringAsFixed(2)}"),
      ),
    );
  }
}
