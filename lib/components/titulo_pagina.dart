import 'package:flutter/material.dart';

class TituloPagina extends StatelessWidget {
  const TituloPagina(
    {required this.titulo, super.key,});

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(titulo,
          style: TextStyle(
              fontFamily: 'DancingScript',
              color: Colors.white,
              fontSize: 35 * MediaQuery.of(context).textScaleFactor)),
    );
  }
}