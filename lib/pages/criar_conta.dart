import 'package:flutter/material.dart';
import 'package:projeto_integrado/components/titulo_pagina.dart';

//Banco de dados
import '../data/db.dart';

//Componentes
import '../components/criar_conta/modal_criar_conta.dart';
import '../components/fundo.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({super.key});

  @override
  State<CriarConta> createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  bool isVisible = false;
  bool isVisibleConfirm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Food Snacks",
              style: TextStyle(fontFamily: "DancingScript", fontSize: 25.0)),
        ),
        body: Fundo(
          child: Container(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TituloPagina(titulo: "Criar Conta"),
                  Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.18,
                                vertical:
                                    MediaQuery.of(context).size.width * 0.01),
                            child: TextField(
                                onChanged: (text) {},
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: true,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.account_circle),
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: "Insira seu nome",
                                    border: OutlineInputBorder())),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.18,
                                vertical:
                                    MediaQuery.of(context).size.width * 0.01),
                            child: TextField(
                                onChanged: (text) {
                                  setState(() {});
                                },
                                obscureText: isVisible ? false : true,
                                autocorrect: true,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isVisible = !isVisible;
                                          });
                                        },
                                        icon: isVisible
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off)),
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: "Insira sua senha",
                                    border: const OutlineInputBorder())),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.18,
                                vertical:
                                    MediaQuery.of(context).size.width * 0.01),
                            child: TextField(
                                onChanged: (text) {
                                  setState(() {});
                                },
                                obscureText: isVisibleConfirm ? false : true,
                                autocorrect: true,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isVisibleConfirm =
                                                !isVisibleConfirm;
                                          });
                                        },
                                        icon: isVisibleConfirm
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off)),
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: "Confirme sua senha",
                                    border: const OutlineInputBorder())),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.18,
                                vertical:
                                    MediaQuery.of(context).size.width * 0.01),
                            child: TextField(
                                onChanged: (text) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.number,
                                autocorrect: true,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: "Insira seu CPF",
                                    border: OutlineInputBorder())),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.18,
                                vertical:
                                    MediaQuery.of(context).size.width * 0.01),
                            child: TextField(
                                onChanged: (text) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.number,
                                autocorrect: true,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: "Insira sua data de nascimento",
                                    border: OutlineInputBorder())),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      db.query("");
                                      showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const ModalCriarConta();
                                          });
                                    },
                                    child: const Text("Confirmar")),
                              ))
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
