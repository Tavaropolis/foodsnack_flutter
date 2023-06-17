import "package:mysql_client/mysql_client.dart";

class DbOpenClose {
  // O finalizer vai fechar a conexão automaticamente
  // quando o objeto sair do escopo
  static final Finalizer<MySQLConnection?> _finalizer = Finalizer((conn) {
    conn?.close();
  });

  MySQLConnection? _connection;

  DbOpenClose() {
    // Cria a conexão
    MySQLConnection.createConnection(
      host: 'localhost',
      port: 3306,
      userName: 'root',
      password: 'ifsp',
      databaseName: 'foodsnack',
      // e assim que conectar
    ).then((value) {
      value.connect().then((_) {
        // coloca o valor no campo _connection
        _connection = value;
        // e liga o _finalizer para desconectar antes de apagar o objeto
        _finalizer.attach(this, value, detach: this);
      });
    });
  }

  Future<IResultSet> query(String sql, [Map<String, dynamic>? params]) async {
    while (_connection == null) {
      await Future.delayed(const Duration(milliseconds: 10));
    }
    var result = await _connection!.execute(sql, params);
    return result;
  }
}

var db = DbOpenClose();
