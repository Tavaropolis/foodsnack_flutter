import 'package:flutter/material.dart';

//Classes
import 'produto.dart';

class CarrinhoLista extends ChangeNotifier {
  List<Produto> listaCarrinho = [];
  num precoTotal = 0;

  adicionarProduto(Produto produto) {
    var valida = listaCarrinho.where((element) => element.nome == produto.nome);
    if (valida.isEmpty) {
      listaCarrinho.add(produto);
    } else {
      valida.first.quantidade += produto.quantidade;
    }
    notifyListeners();
  }

  limparCarrinho() {
    listaCarrinho = [];
    precoTotal = 0;
    notifyListeners();
  }

  calcularPrecoTotal() {
    precoTotal = 0;
    for (var item in listaCarrinho) {
        precoTotal += (item.preco * item.quantidade);
     }
    notifyListeners();
  }
}

final carrinho = CarrinhoLista();
