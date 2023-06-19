import 'package:flutter/material.dart';

class DialogValidacao extends StatelessWidget {
  const DialogValidacao({
    super.key,
    required this.mensagem
  });

  final String mensagem;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        mensagem,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent,
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Entendi",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)))
      ],
    );
  }
}