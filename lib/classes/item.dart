import '../data/db.dart';

class Item {
  final int id;
  final String descricao;
  final num valor;
  final num tipoItemId;

  static int numberOfRows = 0;

  Item(
      {required this.id,
      required this.descricao,
      required this.valor,
      required this.tipoItemId});

  static Future<Iterable<Item>> getAll() async {
    var db = DbOpenClose();

    var itemMenu = await db.query('SELECT * FROM Item');

    Item.numberOfRows = itemMenu.length;
    return itemMenu.rows.map((row) => Item(
          id: int.parse(row.colByName('id')!),
          descricao: row.colByName('descricao')!,
          valor: num.parse(row.colByName('valor')!),
          tipoItemId: int.parse(row.colByName('descricao')!),
        ));
  }
}
