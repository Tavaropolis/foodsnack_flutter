import 'package:flutter/material.dart';

//Classes
import '../../classes/produto.dart';

//Componentes
import 'cartao.dart';

class ContainerHome extends StatelessWidget {
  const ContainerHome({
    required this.listaCartoes,
    super.key,
  });

  final List<Produto> listaCartoes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var cartao in listaCartoes)
                Center(child: Cartao(produto: cartao))
            ],
          )),
    );
  }
}
