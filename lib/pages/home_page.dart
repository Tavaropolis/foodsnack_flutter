import 'package:flutter/material.dart';

//Banco de dados
import '../data/db.dart';

//Classes
import '../classes/carrinho.dart';
import '../classes/produto.dart';

//Componentes
import '../components/home_page/container_home.dart';
import '../components/fundo.dart';
import '../components/home_page/search_box.dart';
import '../components/home_page/titulo_container.dart';
import '../components/home_page/modal_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    myFuture();
  }

  List<Produto> listaSalgados = [];
  List<Produto> listaDoces = [];
  List<Produto> listaBebidas = [];

  Future myFuture() async {
    var salgados = await db.query("SELECT * FROM Item WHERE Tipo_Item_id = 1");
    salgados.rows.map((e) => e.assoc());

    var doces = await db.query("SELECT * FROM Item WHERE Tipo_Item_id = 3");
    doces.rows.map((e) => e.assoc());

    var bebidas = await db.query("SELECT * FROM Item WHERE Tipo_Item_id = 2");
    bebidas.rows.map((e) => e.assoc());

    listaSalgados = [
      ...salgados.rows
          .map((e) => Produto(
              nome: e.typedColByName("Descricao"),
              preco: num.parse(e.typedColByName("Valor"))))
          .toList(),
      Produto(nome: "Coxinha", preco: 5.00, foto: "coxinha.jpg"),
    ];

    listaDoces = [
      ...doces.rows
          .map((e) => Produto(
              nome: e.typedColByName("Descricao"),
              preco: num.parse(e.typedColByName("Valor"))))
          .toList(),
      Produto(nome: "Pé de moça", preco: 5.00, foto: "pedemoca.jpg")
    ];

    listaBebidas = [
      ...bebidas.rows
          .map((e) => Produto(
              nome: e.typedColByName("Descricao"),
              preco: num.parse(e.typedColByName("Valor"))))
          .toList(),
      Produto(nome: "Coca-cola", preco: 5.00, foto: "cocacola.jpg"),
      Produto(nome: "Tampico", preco: 6.00, foto: "tampico.jpg")
    ];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Fundo(
      child: ListView(
        children: [
          const SearchBox(),
          const TituloContainer(nome: "Salgados"),
          ContainerHome(listaCartoes: listaSalgados),
          const TituloContainer(nome: "Doces"),
          ContainerHome(listaCartoes: listaDoces),
          const TituloContainer(nome: "Bebidas"),
          ContainerHome(listaCartoes: listaBebidas),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10),
            child: SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    for (var salgado in listaSalgados) {
                      if (salgado.quantidade > 0) {
                        carrinho.adicionarProduto(salgado);
                        carrinho.calcularPrecoTotal();
                      }
                    }
                    for (var doce in listaDoces) {
                      if (doce.quantidade > 0) {
                        carrinho.adicionarProduto(doce);
                        carrinho.calcularPrecoTotal();
                      }
                    }
                    for (var bebida in listaBebidas) {
                      if (bebida.quantidade > 0) {
                        carrinho.adicionarProduto(bebida);
                        carrinho.calcularPrecoTotal();
                      }
                    }

                    showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return const ModalHome();
                        });
                  },
                  child: Text(
                    "Finalizar compra",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15 * MediaQuery.of(context).textScaleFactor),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
