import '../data/db.dart';

class TipoItem {
  final int id;
  final String tipo;

  static int numberOfRows = 0;

  TipoItem({
    required this.id, 
    required this.tipo
  });
  
  static Future<Iterable<TipoItem>> getAll() async {
    var db = DbOpenClose();

    var tipoItem = await db.query('SELECT * FROM Tipo_Item');

    TipoItem.numberOfRows = tipoItem.length;
    return tipoItem.rows.map(
      (row) => TipoItem(
          id: int.parse(row.colByName('id')!),
          tipo: row.colByName('tipo')!,
          )
    );
  } 
}
