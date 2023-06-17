import 'package:flutter/material.dart';

class TituloContainer extends StatelessWidget {
  const TituloContainer({
    super.key,
    required this.nome,
  });

  final String nome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        nome, //Nome recebido por parametro
        style: TextStyle(
            fontFamily: 'DancingScript', color: Colors.white, fontSize: 35 * MediaQuery.of(context).textScaleFactor),
      ),
    );
  }
}
