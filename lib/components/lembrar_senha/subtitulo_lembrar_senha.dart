import 'package:flutter/material.dart';

class SubTituloLembrarSenha extends StatelessWidget {
  const SubTituloLembrarSenha({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Insira seu email de criação da conta", style: TextStyle(
            fontFamily: 'DancingScript', color: Colors.white, fontSize: 25 * MediaQuery.of(context).textScaleFactor)),
    );
  }
}