import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.red,
            ),
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            hintText: 'Pesquisar',
            filled: true),
      ),
    );
  }
}
