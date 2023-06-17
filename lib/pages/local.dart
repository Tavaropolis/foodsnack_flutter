import 'package:flutter/material.dart';

//Componentes
import '../components/fundo.dart';
import '../components/local/dados_local.dart';
import '../components/local/foto_local.dart';

class Local extends StatelessWidget {
  const Local({super.key});

  @override
  Widget build(BuildContext context) {
    return const Fundo(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FotoLocal(),
          DadosLocal(),
        ],
      ),
    );
  }
}




