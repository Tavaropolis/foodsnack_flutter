import '../data/db.dart';

class TipoPagamento {
  final int id;
  final String tipo;

  static int numberOfRows = 0;

  TipoPagamento({
    required this.id, 
    required this.tipo});

    static Future<Iterable<TipoPagamento>> getAll() async {
    var db = DbOpenClose();

    var tipoPagamento = await db.query('SELECT * FROM Tipo_Pagamento');

    TipoPagamento.numberOfRows = tipoPagamento.length;
    return tipoPagamento.rows.map(
      (row) => TipoPagamento(
          id: int.parse(row.colByName('id')!),
          tipo: row.colByName('tipo')!
        )
    );
  } 
}