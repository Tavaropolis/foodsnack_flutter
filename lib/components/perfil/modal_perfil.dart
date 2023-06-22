import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

//Banco de dados
import '../../data/db.dart';

//Classes
import '../../classes/cliente.dart';

//Componentes
import '../dialog_validacao.dart';

//Pages
import 'package:projeto_integrado/pages/login.dart';

class ModalPerfil extends StatefulWidget {
  const ModalPerfil({
    super.key,
  });

  @override
  State<ModalPerfil> createState() => _ModalPerfilState();
}

class _ModalPerfilState extends State<ModalPerfil> {
  var deleteController = TextEditingController();

  String? userPassword;
  bool isVisible = true;

  _deleteUser() async {
    var bytes = utf8.encode(deleteController.text);
    userPassword = sha1.convert(bytes).toString();

    if (userPassword == clienteLogado.senha) {
      try {
        db.query(
            "DELETE FROM Cliente WHERE CPF = :CPF", {"CPF": clienteLogado.cpf});

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ));

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Conta deletada com sucesso 😁")));
      } catch (e) {
        // ignore: avoid_print
        print(e);
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const DialogValidacao(
                  mensagem: "Ocorreu um erro inesperado 😥");
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DialogValidacao(mensagem: "Senha inválida 😥");
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.redAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
                child: Text("Deseja deletar sua conta?",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "DancingScript",
                        fontSize:
                            28 * MediaQuery.of(context).textScaleFactor))),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.18),
              child: TextField(
                  controller: deleteController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  obscureText: isVisible,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: deleteController.text.isNotEmpty
                            ? () {
                                _deleteUser();
                              }
                            : null,
                        child: const Text("Confirmar")),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
