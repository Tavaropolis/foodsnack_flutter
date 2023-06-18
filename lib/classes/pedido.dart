import '../data/db.dart';

class Pedido {
  final int numero;
  final String statusPedido;
  final DateTime dataPedido;
  final num totalPedido;
  final String clienteCPF;
  final int funcionarioMatricula;

  static int numberOfRows = 0;

  Pedido({
    required this.numero, 
    required this.statusPedido,
    required this.dataPedido,
    required this.totalPedido,
    required this.clienteCPF,
    required this.funcionarioMatricula});

    static Future<Iterable<Pedido>> getAll() async {
    var db = DbOpenClose();

    var pedido = await db.query('SELECT * FROM Pedido');

    Pedido.numberOfRows = pedido.length;
    return pedido.rows.map(
      (row) => Pedido(
          numero: int.parse(row.colByName('numero')!),
          statusPedido: row.colByName('Status_pedido')!,
          dataPedido: DateTime.parse(row.colByName('Data_pedido')!),
          totalPedido: int.parse(row.colByName('Total_pedido')!),
          clienteCPF: row.colByName('Cliente_CPF')!,
          funcionarioMatricula: int.parse(row.colByName('Funcionario_Matricula')!)
        )
    );
  } 
}