import 'package:flutter/material.dart';

class Fundo extends StatelessWidget {
  final Widget? child;

  const Fundo({
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover)),
        child: child);
  }
}
