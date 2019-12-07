import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "hajj.db";

  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // database table and column names
  static final String HADITH_ID_GLOBAL = "_id";
  static final String HADITH_COLLECTION_ID = "CollectionID";
  static final String HADITH_BOOK_ID = "BookID";
  static final String HADITH_CHAPTER_ID = "ChapID";
  static final String HADITH_ID = "HadithID";
  static final String LANGUAGE = "_en";
  static final String HADITH_TABLE = "hadiths";

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


// open the database
      return await openDatabase(path, readOnly: true);
    }
    Future<List<Map>> queryBooksByCollectionId(int id) async {
      Database db = await database;
      List<Map> maps =
      await db.rawQuery("select * from Book where CollectionID=$id");
      return maps;
    }

    Future<List<Map>> queryHadithsByQuery(String query) async {
      Database db = await database;
      List<Map> maps =
      await db.rawQuery("select * from hadiths where hadiths match '$query'");

      print("select * from hadiths where match $query");
      return maps;
    }

    Future<List<Map>> queryHadithsByBookId(int collectionID,
        String bookID) async {
      Database db = await database;
      List<Map> maps = await db.rawQuery(
          "select * from hadiths where hadiths match 'CollectionID: $collectionID BookID:$bookID'");

      print(
          "select * from hadiths where CollectionID=$collectionID and BookID = $bookID");
      return maps;
    }
  }
}
