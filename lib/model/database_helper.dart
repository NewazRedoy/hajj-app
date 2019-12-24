import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "hadith.db";

  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // database table and column names
  static final String HADITH_ID_GLOBAL = "_id";
  static final String HADITH_COLLECTION_ID = "topic_id";
  static final String HADITH_BOOK_ID = "subtopic_id";
  static final String HADITH_CHAPTER_ID = "ChapID";
  static final String HADITH_ID = "content_id";
  static final String LANGUAGE = "_en";

//    static final String DIACLESS = "_diacless";
  static final String DIACLESS = "";
  static final String RELATED_REFERENCE = "related_en";
  static final String HADITH_NARRATOR = "narrator" + LANGUAGE;
  static final String HADITH_BODY = "text" + LANGUAGE;
  static final String HADITH_GRADE = "grade" + LANGUAGE;
  static final String HADITH_REFERENCE = "reference" + LANGUAGE;
  static final String HADITH_NARRATOR_ARABIC = "narrator_ar" + DIACLESS;
  static final String HADITH_BODY_ARABIC = "text_ar" + DIACLESS;

  static final String HADITH_NARRATOR_ARABICEND = "narrator_arend" + DIACLESS;
  static final String BOOK_NAME = "name_en";
  static final String BOOK_TABLE = "Subtopic";
  static final String CHAPNAME = "name_en";
  static final String columns = " rowid AS _id," +
      HADITH_COLLECTION_ID +
      "," +
      HADITH_BOOK_ID +
      "," +
      HADITH_CHAPTER_ID +
      "," +
      HADITH_ID +
      "," +
      HADITH_NARRATOR +
      "," +
      HADITH_BODY +
      "," +
      HADITH_NARRATOR_ARABIC +
      "," +
      HADITH_BODY_ARABIC +
      "," +
      HADITH_NARRATOR_ARABICEND +
      "," +
      HADITH_GRADE +
      "," +
      HADITH_REFERENCE +
      "," +
      RELATED_REFERENCE;

  static final String HADITH_TABLE = "content";

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();

    return _database;
  }

  // open the database
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      //todo add checks for version control as well
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "hadith.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
// open the database
    return await openDatabase(path, readOnly: true);
  }

  Future<List<Map>> querySubtopicsByTopicId(int id) async {
    Database db = await database;
    List<Map> maps =
        await db.rawQuery("select * from Subtopic where topic_id=$id");
    return maps;
  }

  Future<List<Map>> queryHadithsByQuery(String query) async {
    Database db = await database;
    List<Map> maps =
        await db.rawQuery("select * from content where content match '$query'");

    print("select * from content where match $query");
    return maps;
  }

//  Future<List<Map>> queryHadithsBySubtopicId(
//      int topicID, String bookID) async {
//    Database db = await database;
//    List<Map> maps = await db.rawQuery(
//        "select * from content where content match 'topic_id: $topicID subtopic_id:$bookID'");
//
//    print("select * from content where topic_id=$topicID and subtopic_id = $bookID");
//    return maps;
//  }

  Future<List<Map>> queryHadithsBySubtopicId(int topicID, int bookID) async {
    Database db = await database;
    List<Map> maps = await db.rawQuery(
        "select * from content where topic_id= $topicID and subtopic_id=$bookID");

    print(
        "select * from content where topic_id=$topicID and subtopic_id = $bookID");
    return maps;
  }

  Future<List<Map>> queryBooksByTopicId(int id) async {
    Database db = await database;
    List<Map> maps =
        await db.rawQuery("select * from Subtopic where topic_id=$id");
    return maps;
  }

//  Future<List<Subtopic>> querySubtopicsByTopicId() async {
//    Database db = await database;
//    List<Map> maps = await db.query(tableWords);
//    if (maps.length > 0) {
//      List<Product> words = [];
//      maps.forEach((map) => words.add(Product.fromJson(map)));
//      return words;
//    }
//    return null;
//  }

//
//  Future<int> deleteWord(int id) async {
//    Database db = await database;
//    return await db.delete(tableWords, where: '$columnId = ?', whereArgs: [id]);
//  }
//
//  Future<int> update(Product product) async {
//    Database db = await database;
//    return await db.update(tableWords, product.toJson(),
//        where: '$columnId = ?', whereArgs: [product.id]);
//  }
}
