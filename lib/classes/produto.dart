import 'package:flutter/material.dart';

class Produto extends ChangeNotifier {
  String nome;
  num preco;
  String foto;
  num quantidade = 0;

  Produto({required this.nome, required this.preco, this.foto = "semfoto.jpg"});
}
