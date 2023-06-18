import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardPedido extends StatefulWidget {
  const CardPedido({
    super.key,
    required this.dataPedido,
    required this.totalPedido,
  });

  final DateTime dataPedido;
  final num totalPedido;

  @override
  State<CardPedido> createState() => _CardPedidoState();
}

class _CardPedidoState extends State<CardPedido> {
   var localFormat = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrangeAccent,
      child: ListTile(
        mouseCursor: SystemMouseCursors.click,
        leading: const Icon(Icons.lens),
        title: Text(localFormat.format(widget.dataPedido).toString()),
        subtitle: Text("R\$ ${widget.totalPedido.toStringAsFixed(2)}"),
      ),
    );
  }
}
