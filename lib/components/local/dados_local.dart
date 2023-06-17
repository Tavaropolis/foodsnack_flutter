import 'package:flutter/material.dart';

class DadosLocal extends StatelessWidget {
  const DadosLocal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
          width: 0.45 * MediaQuery.of(context).size.width,
          height: 0.40 * MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Horário de funcionamento",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                      fontFamily: "DancingScript",
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Segunda a Sexta: 9:00 às 21:00",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                      fontFamily: "DancingScript",
                      fontWeight: FontWeight.bold)),
            ),
          ])),
    );
  }
}