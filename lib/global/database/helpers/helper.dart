import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:print_to_pdf/global/database/models/data.dart';
import 'package:sqflite/sqflite.dart';

const DB_NAME = 'pdf';

class DBHelper {
  static DBHelper _dbHelper;
  static Database _database;

  DBHelper._createObject();

  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'pdf.db';

    //create, read databases
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return todoDatabase;
  }

  //buat tabel baru
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE pdf (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT,
        path TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query(DB_NAME, orderBy: 'title');
    return mapList;
  }

//create databases
  Future<int> insert(PDFData object) async {
    Database db = await this.database;
    int count = await db.insert(DB_NAME, object.toMap());
    return count;
  }

//update databases
  Future<int> update(PDFData object) async {
    Database db = await this.database;
    int count = await db
        .update(DB_NAME, object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete(DB_NAME, where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<PDFData>> getPdfList() async {
    var pdfMapList = await select();
    int count = pdfMapList.length;
    List<PDFData> pdfList = List<PDFData>();
    for (int i = 0; i < count; i++) {
      pdfList.add(PDFData.fromMap(pdfMapList[i]));
    }
    return pdfList;
  }
}
