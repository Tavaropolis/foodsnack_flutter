import 'package:flutter/material.dart';

//Componentes
import '../components/fundo.dart';
import '../components/lembrar_senha/subtitulo_lembrar_senha.dart';
import '../components/lembrar_senha/modal_lembrar_senha.dart';
import '../components/titulo_pagina.dart';

class LembrarSenha extends StatefulWidget {
  const LembrarSenha({super.key});

  @override
  State<LembrarSenha> createState() => _LembrarSenhaState();
}

class _LembrarSenhaState extends State<LembrarSenha> {

  final emailController = TextEditingController();

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
                      child:  TextField(
                        controller: emailController,
                        onChanged: (text) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
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
                            onPressed: 
                            emailController.text.isNotEmpty ?
                            () {
                              showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const ModalLembrarSenha();
                                  });
                            } : null,
                            child: const Text("Enviar")))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}


