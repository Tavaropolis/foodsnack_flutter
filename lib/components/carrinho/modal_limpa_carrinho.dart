import 'package:flutter/material.dart';

//Classes
import '../../classes/carrinho.dart';

class ModalLimpaCarrinho extends StatelessWidget {
  const ModalLimpaCarrinho({
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
            Center(child: Text("Deseja limpar o carrinho?", style: TextStyle(color: Colors.white, fontFamily: "DancingScript", fontSize: 28 * MediaQuery.of(context).textScaleFactor))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: const Text("Cancelar")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(onPressed: () {
                      carrinho.limparCarrinho();
                      Navigator.pop(context);
                    }, child: const Text("Confirmar")),
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