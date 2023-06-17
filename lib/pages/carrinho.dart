import 'package:flutter/material.dart';

//Classes
import '../classes/carrinho.dart';

//Componentes
import '../components/carrinho/preco_total_carrinho.dart';
import '../components/titulo_pagina.dart';
import '../components/carrinho/botoes_carrinho.dart';
import '../components/carrinho/item_produto.dart';
import '../components/carrinho/mensagem_carrinho.dart';
import '../components/fundo.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({super.key});

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return Fundo(
      child: AnimatedBuilder(
        animation: carrinho,
        builder: (context, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TituloPagina(titulo: "Carrinho"),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                    minHeight: 300, minWidth: double.infinity),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: carrinho.listaCarrinho.isEmpty
                    ? const MensagemCarrinho()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              for (var produto in carrinho.listaCarrinho)
                                ItemCarrinho(produto: produto),
                            ],
                          ),
                          const PrecoTotalCarrinho(),
                          const BotoesCarrinho(),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


