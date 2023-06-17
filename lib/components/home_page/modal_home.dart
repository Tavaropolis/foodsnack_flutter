import 'package:flutter/material.dart';

class ModalHome extends StatelessWidget {
  const ModalHome({
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
            Center(child: Text("Adicionado ao carrinho com sucesso 😉", style: TextStyle(color: Colors.white, fontFamily: "DancingScript", fontSize: 25 * MediaQuery.of(context).textScaleFactor))),
          ],
        ),
      ),
    );
  }
}