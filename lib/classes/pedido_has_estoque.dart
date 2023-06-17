import '../data/db.dart';

class PedidoHasEstoque {
  final int numero;
  final int lote;
  final int quantidade;

  static int numberOfRows = 0;

  PedidoHasEstoque({
    required this.numero,
    required this.lote,
    required this.quantidade
  });

  static Future<Iterable<PedidoHasEstoque>> getAll() async {
    var db = DbOpenClose();

    var pedidoHasEstoque = await db.query('SELECT * FROM Pedido_has_Estoque');

    PedidoHasEstoque.numberOfRows = pedidoHasEstoque.length;
    return pedidoHasEstoque.rows.map(
      (row) => PedidoHasEstoque(
          numero: int.parse(row.colByName('numero')!),
          lote: int.parse(row.colByName('lote')!),
          quantidade: int.parse(row.colByName('quatidade')!),
        )
    );
  } 
}