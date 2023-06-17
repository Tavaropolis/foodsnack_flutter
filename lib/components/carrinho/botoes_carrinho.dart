import 'package:flutter/material.dart';
import 'package:projeto_integrado/components/carrinho/modal_limpa_carrinho.dart';

class BotoesCarrinho extends StatelessWidget {
  const BotoesCarrinho({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.26,
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const ModalLimpaCarrinho();
                    });
              },
              child: const Text("Limpar")),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.26,
          height: 50,
          child: ElevatedButton(
            child: const Text("Finalizar"),
            onPressed: () {},
          ),
        ),
      )
    ]);
  }
}
