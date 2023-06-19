import 'package:flutter/material.dart';

//Classes
import '../../classes/produto.dart';

//Componente
import 'cartao_titulo.dart';

class Cartao extends StatefulWidget {
  const Cartao({
    required this.produto,
    super.key,
  });

  final Produto produto;

  @override
  State<Cartao> createState() => _CartaoState();
}

class _CartaoState extends State<Cartao> {
  late final quantidadeController =
      TextEditingController(text: "${widget.produto.quantidade}");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          width: 0.8 * MediaQuery.of(context).size.width,
          height: 0.25 * MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CartaoTitulo(nome: widget.produto.nome),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      height: 0.15 * MediaQuery.of(context).size.height,
                      width: 0.25 * MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      image:
                          AssetImage("assets/products/${widget.produto.foto}"),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                                "R\$ ${widget.produto.preco.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DancingScript",
                                    fontSize: 25)),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      0.25 * MediaQuery.of(context).size.width,
                                  child: TextField(
                                      controller: quantidadeController,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.end,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      onEditingComplete: () {
                                        setState(() {
                                          widget.produto.quantidade = num.parse(
                                              quantidadeController.text);
                                        });
                                        FocusScope.of(context).unfocus();
                                      }),
                                ),
                                SizedBox(
                                  width:
                                      0.1 * MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (widget.produto.quantidade > 0) {
                                            widget.produto.quantidade--;
                                            quantidadeController.text = widget
                                                .produto.quantidade
                                                .toString();
                                          }
                                        });
                                      },
                                      child: const Icon(Icons.expand_more)),
                                ),
                                SizedBox(
                                  width:
                                      0.1 * MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          widget.produto.quantidade++;
                                          quantidadeController.text = widget
                                              .produto.quantidade
                                              .toString();
                                        });
                                      },
                                      child: const Icon(Icons.expand_less)),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
