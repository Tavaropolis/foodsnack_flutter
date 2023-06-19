import '../data/db.dart';

class Cliente {
  String cpf;
  String nome;
  String senha;
  DateTime dtaNasc;

  static int numberOfRows = 0;

  Cliente({
  required this.cpf, 
  required this.nome, 
  required this.senha,
  required this.dtaNasc});

  static Future<Iterable<Cliente>> getAll() async {
    var db = DbOpenClose();

    var cliente = await db.query('SELECT * FROM Cliente');

    Cliente.numberOfRows = cliente.length;
    return cliente.rows.map((row) => Cliente(
          cpf: row.colByName('cpf')!,
          nome: row.colByName('nome')!,
          senha: row.colByName("senha")!,
          dtaNasc: DateTime.parse(row.colByName('Dta_nasc')!),
        ));
  }
}

var clienteLogado = Cliente(cpf: "", nome: "", senha: "", dtaNasc: DateTime.now());