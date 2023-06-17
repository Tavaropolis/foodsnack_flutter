import 'package:flutter/material.dart';

class ModalCriarConta extends StatelessWidget {
  const ModalCriarConta({
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
            Center(child: Text("Conta criada com sucesso 😉", style: TextStyle(color: Colors.white, fontFamily: "DancingScript", fontSize: 30 * MediaQuery.of(context).textScaleFactor))),
          ],
        ),
      ),
    );
  }
}