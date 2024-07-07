
import 'package:currency_converter_app/models/country_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _db;


  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'myDatabase.db');
    _db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return _db;
  }

  Future<Database?> get db async {
    if (_db == null){
      _db  = await initDb() ;
      return _db ;
    }else {
      return _db ;
    }
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        '''CREATE TABLE 'currencies' (taID INTEGER PRIMARY KEY,name TEXT, 
        alpha3 TEXT,id TEXT,currencyName TEXT,currencySymbol TEXT,currencyId TEXT)
        ''');
  }

  Future<List<Map<String,dynamic>>> readData(String q)async{
    Database? myDB=await initDb();
    List<Map<String,dynamic>> response=await myDB!.rawQuery(q);
    return response;
  }
  insertData(CountryModel q)async{
    Database? myDB=await db;
    int response=await myDB!.insert('currencies',{
      'id':q.id,
      'name':q.name,
      'alpha3':q.alpha3,
      'currencyId':q.currencyId,
      'currencyName':q.currencyName,
      'currencySymbol':q.currencySymbol,
    });
    return response;
  }

}