import 'package:flutter/material.dart';
import 'package:projeto_integrado/classes/carrinho.dart';

//Componentes
import '../components/page_view_demo/notificacao.dart';

//Pages
import 'carrinho.dart';
import 'home_page.dart';
import 'local.dart';
import 'pedidos.dart';
import 'perfil.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({
    super.key,
  });

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  int _currentIndex = 0;
  PageController controlePagina = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Food Snacks",
              style: TextStyle(fontFamily: "DancingScript", fontSize: 25.0)),
        ),
        body: PageView(
          controller: controlePagina,
          children: const <Widget>[
            HomePage(),
            Pedidos(),
            Perfil(),
            Local(),
            Carrinho(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            backgroundColor: Colors.red,
            fixedColor: Colors.white,
            unselectedItemColor: Colors.blueGrey[800],
            items: const [
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "Pedidos", icon: Icon(Icons.menu)),
              BottomNavigationBarItem(label: "Perfil", icon: Icon(Icons.person)),
              BottomNavigationBarItem(label: "Local", icon: Icon(Icons.place)),
            ],
            onTap: (int value) {
              setState(() {
                _currentIndex = value;
                controlePagina.jumpToPage(_currentIndex);
              });
            }),
        floatingActionButton: Stack(children: [
          SizedBox(
            width: 75,
            height: 75,
            child: FloatingActionButton(
              onPressed: () {
                controlePagina.jumpToPage(4);
              },
              backgroundColor: Colors.red,
              tooltip: "Ir à página de carrinho",
              child: const Icon(Icons.local_grocery_store, size: 35.0),
            ),
          ),
          carrinho.listaCarrinho.isEmpty
              ? const SizedBox.shrink()
              : const Notificacao()
        ]));
  }
}
