import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/features/todo/domain/entities/todo_model.dart';

import '../../../../core/constants.dart';

class TodoDatabaseHelper {
  static final TodoDatabaseHelper instance = TodoDatabaseHelper._init();

  static Database? _database;
  TodoDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'todos_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY';
    const textType = 'TEXT';
    await db.execute('''
    CREATE TABLE $tableName (
     ${TodoFields.id} $idType,
      ${TodoFields.title} $textType,
      ${TodoFields.description} $textType,
      ${TodoFields.status} $textType,
      ${TodoFields.created} $textType
    )
  ''');
  }

  Future<TodoModel> addTodo(TodoModel todoModel) async {
    final db = await instance.database;

    final id = await db.insert(tableName, todoModel.toMap());
    return todoModel.copyWith(id: id);
  }

  Future<TodoModel> editTodo(TodoModel todoModel) async {
    final db = await instance.database;
    await db.update(
      tableName,
      todoModel.toMap(),
      where: '${TodoFields.id} = ?',
      whereArgs: [todoModel.id],
    );
    return todoModel;
  }

  Future<dynamic> deleteTodo(String id) async {
    final db = await instance.database;
    await db.delete(
      tableName,
      where: '${TodoFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<List<TodoModel>> getAllTodos() async {
    final db = await instance.database;
    final result = await db.query(tableName);
    return result.map((json) => TodoModel.fromMap(json)).toList();
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }

  Future<dynamic> deleteAllTodos() async {
    final db = await instance.database;
    await db.delete(tableName);
  }

  static const tableName = 'todos';
}
