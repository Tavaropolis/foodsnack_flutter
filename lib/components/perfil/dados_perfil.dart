import 'package:flutter/material.dart';

class DadosUsuario extends StatelessWidget {
  const DadosUsuario({
    required this.texto,
    super.key,
  });

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(texto, style: TextStyle(
        fontFamily: 'DancingScript',
        color: Colors.white,
        fontSize: 18 * MediaQuery.of(context).textScaleFactor
      )),
    );
  }
}