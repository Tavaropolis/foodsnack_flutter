import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

//Banco de dados
import '../../data/db.dart';

//Classes
import '../../classes/cliente.dart';

//Componentes
import '../../components/dialog_validacao.dart';

//Pages
import '../../pages/page_view_demo.dart';

class BotaoLogin extends StatefulWidget {
  const BotaoLogin({
    super.key,
    required this.user,
    required this.password,
  });

  final String user;
  final String password;

  @override
  State<BotaoLogin> createState() => _BotaoLoginState();
}

class _BotaoLoginState extends State<BotaoLogin> {
  _validate() async {
    String userLogin;
    String passwordLogin;
    String userBanco = "";
    String passwordBanco = "";

    userLogin = widget.user;
    var bytes = utf8.encode(widget.password);
    passwordLogin = sha1.convert(bytes).toString();

    try {
      var query = await db
          .query("SELECT * FROM Cliente WHERE CPF = :CPF", {"CPF": userLogin});

      for (final row in query.rows) {
        userBanco = row.colByName("CPF")!;
        passwordBanco = row.colByName("Senha")!;

        clienteLogado.cpf = row.colByName("CPF")!;
        clienteLogado.senha = row.colByName("Senha")!;
        clienteLogado.nome = row.colByName("Nome")!;
        clienteLogado.dtaNasc = DateTime.parse(row.colByName("Dta_nasc")!);
      }
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DialogValidacao(
                mensagem: "Ocorreu um erro inesperado 😥");
          });
    }

    if (userLogin == userBanco && passwordLogin == passwordBanco) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PageViewDemo(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DialogValidacao(
                mensagem: "Usuário e senha inválidos 😥");
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
              onPressed: widget.user.isNotEmpty && widget.password.isNotEmpty
                  ? () {
                      _validate();
                    }
                  : null,
              child: const Text("Login"))),
    );
  }
}
