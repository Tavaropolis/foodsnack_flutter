import 'package:flutter/material.dart';
import 'package:projeto_integrado/components/titulo_pagina.dart';

//Componentes
import '../components/fundo.dart';
import '../components/lembrar_senha/subtitulo_lembrar_senha.dart';
import '../components/lembrar_senha/modal_lembrar_senha.dart';

class LembrarSenha extends StatefulWidget {
  const LembrarSenha({super.key});

  @override
  State<LembrarSenha> createState() => _LembrarSenhaState();
}

class _LembrarSenhaState extends State<LembrarSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Food Snacks",
              style: TextStyle(fontFamily: "DancingScript", fontSize: 25.0)),
        ),
        body: Fundo(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TituloPagina(titulo: "Lembrar Senha"),
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SubTituloLembrarSenha(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
                      child: const TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Insira seu email de contato",
                          border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const ModalLembrarSenha();
                                  });
                            },
                            child: const Text("Enviar")))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}


