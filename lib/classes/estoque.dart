import '../data/db.dart';

class Estoque {
  final int lote;
  final int quantDisp;
  final String validade;
  final int itemId;

  static int numberOfRows = 0;

  Estoque({
    required this.lote,
    required this.quantDisp,
    required this.validade,
    required this.itemId
  });

  static Future<Iterable<Estoque>> getAll() async {
    var db = DbOpenClose();

    var estoque = await db.query('SELECT * FROM Estoque');

    Estoque.numberOfRows = estoque.length;
    return estoque.rows.map(
      (row) => Estoque(
          lote: int.parse(row.colByName('lote')!),
          quantDisp: int.parse(row.colByName('Quant_Disp')!),
          validade: row.colByName('validade')!,
          itemId: int.parse(row.colByName('Item_id ')!),
        )
    );
  } 
}