import '../data/db.dart';

class Cliente {
  final String cpf;
  final String nome;
  final String dtaNasc;

  static int numberOfRows = 0;

  Cliente({
  required this.cpf, 
  required this.nome, 
  required this.dtaNasc});

  static Future<Iterable<Cliente>> getAll() async {
    var db = DbOpenClose();

    var cliente = await db.query('SELECT * FROM Cliente');

    Cliente.numberOfRows = cliente.length;
    return cliente.rows.map((row) => Cliente(
          cpf: row.colByName('cpf')!,
          nome: row.colByName('nome')!,
          dtaNasc: row.colByName('Dta_nasc')!,
        ));
  }
}
