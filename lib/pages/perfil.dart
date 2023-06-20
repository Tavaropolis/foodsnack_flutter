import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Classes
import '../../classes/cliente.dart';

//Componentes
import '../components/fundo.dart';
import '../components/perfil/dados_perfil.dart';
import '../components/perfil/modal_perfil.dart';
import '../components/titulo_pagina.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  var localFormat = DateFormat("dd/MM/yyyy");

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
                        DadosUsuario(texto: "Nome: ${clienteLogado.nome}"),
                        DadosUsuario(
                            texto:
                                "Data de Nascimento: ${localFormat.format(clienteLogado.dtaNasc).toString()}"),
                        const DadosUsuario(texto: "Tipo de conta: Cliente"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const ModalPerfil();
                                    });
                              },
                              child: const Text("Apagar conta")),
                        )
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
