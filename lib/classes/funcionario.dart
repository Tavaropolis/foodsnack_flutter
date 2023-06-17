import '../data/db.dart';

class Funcionario {
  final int matricula;
  final String nome;
  final String funcao;
  final String cpf;
  final String dataNasc;

  static int numberOfRows = 0;

  Funcionario({
    required this.matricula, 
    required this.nome,
    required this.funcao,
    required this.cpf,
    required this.dataNasc});

    static Future<Iterable<Funcionario>> getAll() async {
    var db = DbOpenClose();

    var funcionario = await db.query('SELECT * FROM Funcionario');

    Funcionario.numberOfRows = funcionario.length;
    return funcionario.rows.map(
      (row) => Funcionario(
          matricula: int.parse(row.colByName('matricula')!),
          nome: row.colByName('nome')!,
          funcao: row.colByName('funcao')!,
          cpf: row.colByName('cpf')!,
          dataNasc: row.colByName('DataNasc')!,
          )
    );
  } 
}