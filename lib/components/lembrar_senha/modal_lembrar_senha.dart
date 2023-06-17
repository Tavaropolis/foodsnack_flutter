import 'package:flutter/material.dart';

class ModalLembrarSenha extends StatelessWidget {
  const ModalLembrarSenha({
    super.key,
  });

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
            Center(child: Text("Enviaremos um email de contato 😉", style: TextStyle(color: Colors.white, fontFamily: "DancingScript", fontSize: 25 * MediaQuery.of(context).textScaleFactor))),
          ],
        ),
      ),
    );
  }
}