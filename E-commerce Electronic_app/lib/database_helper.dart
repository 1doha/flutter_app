import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'auth_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await database;
    return await db.insert('users', user);
  }

  Future<bool> checkUser(String email, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    print(result);
    return result.isNotEmpty;
  }
}













// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// import 'models/model.dart';

// class DatabaseHelper {
//   List<User> myUsers = [];
//   static final DatabaseHelper _databaseHelper = DatabaseHelper._();
//   DatabaseHelper._(){
//     print("object");
//   }

//   late Database db;

//   factory DatabaseHelper() {
//     return _databaseHelper;
//   }

//   Future<void> initDB() async {
//     String path = await getDatabasesPath();
//     db = await openDatabase(
//       join(path, 'users_demo.db'),
//       onCreate: (database, version) async {
//         await database.execute(
//           """
//             CREATE TABLE users (
//               id INTEGER PRIMARY KEY AUTOINCREMENT, 
//               email TEXT NOT NULL,               
//               password TEXT NOT NULL
//             )
//           """,
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<int> insertUser(User user) async {
//   Future<List<User>> myUsers =  retrieveUsers();
//   myUsers.then((value) =>{
//     value.forEach((element) {
//     if(user.email == element.email) {
//         print("Exist");
//       }
//     })
//   } );
//     int result = await db.insert('users', user.toMap());
//     return result;
//   }


//   Future<List<User>> retrieveUsers() async {
//     final List<Map<String, Object?>> queryResult = await db.query('users');
//     myUsers  = queryResult.map((e) => User.fromMap(e)).toList();
//     print(myUsers);
//     return queryResult.map((e) => User.fromMap(e)).toList();
//   }

//   Future<int> CheckUser(int id) async{
//       return 1;
//   }


// }