import 'package:flutter/material.dart';

class FotoLocal extends StatelessWidget {
  const FotoLocal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 0.40 * MediaQuery.of(context).size.width,
        height: 0.40 * MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/local.png"),
                fit: BoxFit.cover),
            borderRadius:
                BorderRadius.all(Radius.circular(15))));
  }
}