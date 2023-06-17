import 'package:flutter/material.dart';

//Componentes
import '../components/fundo.dart';
import '../components/perfil/dados_perfil.dart';
import '../components/titulo_pagina.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Fundo(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TituloPagina(titulo: "Meu Perfil"),
          Container(
              width: double.infinity,
              height: 0.6 * MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DadosUsuario(texto: "Nome: Usuário"),
                        DadosUsuario(texto: "Data de Nascimento: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
                        const DadosUsuario(texto: "Tipo de conta: Usuário"),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, size: 80, color: Colors.white)
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}


