import 'package:flutter/material.dart';

class Notificacao extends StatelessWidget {
  const Notificacao({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 20,
        height: 20,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
        child: const Icon(Icons.priority_high, size: 15));
  }
}
