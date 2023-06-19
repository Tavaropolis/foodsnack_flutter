import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Banco de dados
import '../data/db.dart';

//Componentes
import '../components/fundo.dart';
import '../components/titulo_pagina.dart';
import '../components/criar_conta/modal_criar_conta.dart';
import '../components/criar_conta/dialog_criar_conta.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({super.key});

  @override
  State<CriarConta> createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  _validate() async {
        
    String? cpfConsulta;

    var query = await db.query("SELECT * FROM Cliente WHERE CPF = :CPF", {"CPF": cpfController.text});
    for (final row in query.rows) {
      cpfConsulta = row.colByName("CPF");
    }
    query.rows.map((e) => e.assoc());

    bool userActive = false;
    bool passwordActive = false;
    bool cpfActive = false;
    bool dataActive = false;

    userActive = verificaNome();
    passwordActive = verificaSenha();
    cpfActive = verificaCPF(cpfConsulta);
    dataActive = verificaData();

    if(userActive && passwordActive && cpfActive && dataActive) {
      var dtaNasc = DateFormat('yyyy-MM-dd').format(DateTime.parse(dtaNascController.text));

      try {
        await db.query("INSERT INTO Cliente (Nome, Senha, CPF, Dta_nasc) VALUES ( :Nome, sha1(:Senha), :CPF, :dta_Nasc)", {"Nome": userController.text, "Senha": passwordController.text, "CPF": cpfController.text, "dta_Nasc": dtaNasc});
      } on Exception catch(e) {
         // ignore: use_build_context_synchronously
         showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DialogCriarConta(mensagem: "Ocorreu um erro inesperado 😥");
        });
      }

      // ignore: use_build_context_synchronously
      showModalBottomSheet<void>(
        context: context, 
        builder: (BuildContext context) {
          return const ModalCriarConta();
        }
      );
    }
  }

  verificaNome() {
    if (userController.text.length < 5) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DialogCriarConta(mensagem: "Nome precisa ter mais de 4 caracteres 😥");
          });
      return false;
    } else {
      return true;
    }
  }

  verificaSenha() {
    if (passwordController.text != passwordConfirmController.text) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DialogCriarConta(mensagem: "Os campos de senha não estão iguais 😥");
          });
      return false;
    } else {
      return true;
    }
  }

  verificaCPF(String? cpfConsulta) {
    if(cpfController.text.length < 11) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DialogCriarConta(mensagem: "CPF precisa ter 11 caracteres 😥");
        }
      );
      return false;
      } else if (cpfConsulta == cpfController.text) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DialogCriarConta(mensagem: "CPF já cadastrado 😥");
        });
        return false;
      } else {
      try {
        num.parse(cpfController.text);
        return true;
      } on Exception catch (e) {
        print(e.runtimeType);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DialogCriarConta(mensagem: "CPF precisa ter apenas números 😥");
        });
        return false;
      }
    }
  }

  verificaData() {
    try {
       DateFormat('yyyy-MM-dd').format(DateTime.parse(dtaNascController.text));
       return true;
    } on Exception catch(e) {
      print(e.runtimeType);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DialogCriarConta(mensagem: "Data com formatação errada 😥");
        });
      return false;
    }
  }

  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final cpfController = TextEditingController();
  final dtaNascController = TextEditingController();

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
                                controller: userController,
                                onChanged: (text) {
                                  setState(() {});
                                },
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
                                controller: passwordController,
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
                                controller: passwordConfirmController,
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
                                controller: cpfController,
                                onChanged: (text) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.number,
                                autocorrect: true,
                                textInputAction: TextInputAction.next,
                                maxLength: 11,
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
                                controller: dtaNascController,
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
                                    onPressed:
                                        (userController.text.isNotEmpty &&
                                                passwordController
                                                    .text.isNotEmpty &&
                                                passwordConfirmController
                                                    .text.isNotEmpty &&
                                                cpfController.text.isNotEmpty &&
                                                dtaNascController
                                                    .text.isNotEmpty)
                                            ? () {
                                                _validate();
                                              }
                                            : null,
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


