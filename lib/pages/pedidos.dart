import 'package:flutter/material.dart';

//Banco de dados
import '../components/pedidos/card_pedido.dart';
import '../data/db.dart';

//Pedidos
import '../classes/pedido.dart';

//Componentes
import '../components/fundo.dart';
import '../components/titulo_pagina.dart';

class Pedidos extends StatefulWidget {
  const Pedidos({super.key});

  @override
  State<Pedidos> createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  @override
  void initState() {
    super.initState();
    myFuture();
  }

  List<Pedido> listaPedidos = [];

  Future myFuture() async {
    var pedidos =
        await db.query("SELECT * FROM Pedido WHERE Status_pedido = 'P'");
    pedidos.rows.map((e) => e.assoc());

    listaPedidos = [
      ...pedidos.rows.map((e) => Pedido(
          numero: int.parse(e.typedColByName("Numero")),
          statusPedido: e.typedColByName("Status_pedido"),
          dataPedido: e.typedColByName("Data_pedido"),
          totalPedido: num.parse(e.typedColByName("Total_pedido")),
          clienteCPF: e.typedColByName("Cliente_CPF"),
          funcionarioMatricula:
              int.parse(e.typedColByName("Funcionario_Matricula"))))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Fundo(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TituloPagina(titulo: "Histórico de Pedidos"),
          Container(
              width: double.infinity,
              height: 0.6 * MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ListView(
                // Transformar em ListView.builder
                children: [
                  Column(children: [
                    for (var pedido in listaPedidos)
                      CardPedido(
                          dataPedido: pedido.dataPedido,
                          totalPedido: pedido.totalPedido),
                    Card(
                      color: Colors.deepOrangeAccent,
                      child: ListTile(
                          mouseCursor: SystemMouseCursors.click,
                          leading: const Icon(Icons.lens),
                          title: Text(
                              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
                          subtitle: const Text("R\$ 50.00")),
                    ),
                  ]),
                ],
              )),
        ],
      ),
    );
  }
}
