// needed for Directory()
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hajjapp/model/ArabicSentences.dart';
import 'package:hajjapp/model/ArabicSentencesCategory.dart';
import 'package:hajjapp/model/Content.dart';
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/model/DuaDetail.dart';
import 'package:hajjapp/model/QuestionDetail.dart';
import 'package:hajjapp/model/QuestionsCategory.dart';
import 'package:hajjapp/model/SearchItem.dart';
import 'package:hajjapp/model/Subtopic.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'RepositoryInterface.dart';

// database table and column names
const String HADITH_ID_GLOBAL = "_id";
const String HADITH_COLLECTION_ID = "topic_id";
const String HADITH_SUBTOPIC_ID = "subtopic_id";
const String HADITH_CHAPTER_ID = "ChapID";
const String HADITH_ID = "content_id";
const String LANGUAGE = "_en";

//    const String DIACLESS = "_diacless";
const String DIACLESS = "";
const String RELATED_REFERENCE = "related_en";
const String HADITH_NARRATOR = "narrator" + LANGUAGE;
const String HADITH_BODY = "text" + LANGUAGE;
const String HADITH_GRADE = "grade" + LANGUAGE;
const String HADITH_REFERENCE = "reference" + LANGUAGE;
const String HADITH_NARRATOR_ARABIC = "narrator_ar" + DIACLESS;
const String HADITH_BODY_ARABIC = "text_ar" + DIACLESS;

const String HADITH_NARRATOR_ARABICEND = "narrator_arend" + DIACLESS;
const String SUBTOPIC_NAME = "name_en";
const String SUBTOPIC_TABLE = "Subtopic";
const String CHAPNAME = "name_en";
const String columns = " rowid AS _id," +
    HADITH_COLLECTION_ID +
    "," +
    HADITH_SUBTOPIC_ID +
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

const String HADITH_TABLE = "content";

const _databaseName = "hajjdb.db";

const _databaseVersion = 3;

_writeIsolate(args) {
  var data = args[0];
  Uint8List pdfBytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  File outputFile = args[1];

  outputFile.writeAsBytes(pdfBytes, flush: true);
}

class LocalRepository implements RepositoryInterface {
  // This is the actual database filename that is saved in the docs directory.

  LocalRepository() {
    initDatabase();
  }

  // Only allow a single open connection to the database.
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();

    return _database;
  }

  // open the database
  initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

// Check if the database exists
    var exists = await databaseExists(path);
    Database db;

    if (!exists) {
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      await copyDataBaseFromAsset(path);
      db = await openDatabase(path,  version: _databaseVersion);
    }else {
      db = await openDatabase(path, readOnly: true);
    }

// open the database
    var dbVersion = await db.getVersion();
    print("Version compare $dbVersion $_databaseVersion");
    if (dbVersion < _databaseVersion) {
      print("Creating new copy from asset as version low");
      await copyDataBaseFromAsset(path);
      db = await openDatabase(path, version: _databaseVersion);
    } else {
      print("Opening existing database");
    }

    return db;
  }

  Future<bool> copyDataBaseFromAsset(String path) async {
    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(join("assets", "hajjdb.db"));
//    List<int> bytes =
//    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // Write and flush the bytes written
//    await File(path).writeAsBytes(bytes, flush: true);

    final outputFile = File(path);

    await compute(_writeIsolate, [data, outputFile]);
    print('Copy done!');

    return true;
  }

  @override
  Future<List<Content>> queryHadithsBySubtopicId(int topicID, int subtopicID) async {
    Database db = await database;
    List<Map> maps =
        await db.rawQuery("select rowid, * from content where topic_id= $topicID and subtopic_id=$subtopicID");

    print("select * from content where topic_id=$topicID and subtopic_id = $subtopicID size:${maps.length}");

    return maps.map((e) => Content.fromMap(e)).toList();
  }

  @override
  Future<List<Subtopic>> querySubtopicsByTopicId(int id) async {
    Database db = await database;
    List<Map> maps = await db.rawQuery("select * from Subtopic where topic_id=$id");
    return maps.map((e) => Subtopic.fromJson(e)).toList();
  }

  @override
  Future<List<SearchItem>> querybySearch(String term) async {
    term = term.replaceAll('\'', '\'\'');

    Database db = await database;

    List<SearchItem> items = [];

    List<Map> maps = await db.rawQuery("select * from Subtopic where name_en like '%$term%'");
    print(maps);
    maps.forEach((row) {
      var topic = Subtopic.fromJson(row);
      items.add(SearchItem(topic.name, "", PageViewType.Content, topic));
    });

    List<Map> maps1 = await db.rawQuery("select * from Content where text like '%$term%'");
    print(maps1);
    maps1.forEach((row) async {
      var topic = Content.fromMap(row);
      List<Map> maps = await db.rawQuery("select * from Subtopic where subtopic_id = ${topic.subtopic_id}");
      maps.forEach((row) {
        var subtopic = Subtopic.fromJson(row);
        if (!items.any((e) => e.name == subtopic.name)) {
          items.add(SearchItem(subtopic.name, "", PageViewType.Content, subtopic));
        }
      });
    });

    List<Map> maps2 = await db.rawQuery("select * from DuaCategory where name like '%$term%'");
    print(maps2);
    maps2.forEach((row) {
      var topic = DuaCategory.fromJson(row);
      items.add(SearchItem(topic.name, "", PageViewType.Dua, topic));
    });

    List<Map> maps3 = await db.rawQuery("select * from QuestionCategory where name like '%$term%'");
    print(maps3);
    maps3.forEach((row) {
      var topic = QuestionCategory.fromJson(row);
      items.add(SearchItem(topic.name, "", PageViewType.Question, topic));
    });

    print(items);
    return items;
  }

  @override
  Future<List<QuestionDetail>> queryQuestionsByCategoryId(int category_id) async {
    Database db = await database;
    List<Map> maps = await db.rawQuery("select * from QuestionAnswer where category_id=$category_id");
    return maps.map((e) => QuestionDetail.fromJson(e)).toList();
  }

  @override
  Future<List<QuestionCategory>> queryQuestionCategories() async {
    Database db = await database;
    List<Map> maps = await db.rawQuery("select * from QuestionCategory");
    return maps.map((e) => QuestionCategory.fromJson(e)).toList();
  }

  @override
  Future<List<Dua>> queryDuaByCategoryId(int allDuacategory_id) async {
    Database db = await database;
    List<Map> maps = await db.rawQuery("select * from Dua where category_id=$allDuacategory_id");
    return maps.map((e) => Dua.fromJson(e)).toList();
  }

  @override
  Future<List<DuaCategory>> queryAllDuaCategories() async {
    Database db = await database;
    List<Map> maps = await db.rawQuery("select * from DuaCategory");
    return maps.map((e) => DuaCategory.fromJson(e)).toList();
  }

  @override
  Future<List<DuaCategory>> queryFavDuas(List<String> ids) async {
    Database db = await database;
    List<Map> maps = await db.rawQuery("select * from DuaCategory,Dua where Dua.dua_id in (${ids.join(",")}) and DuaCategory.id = Dua.category_id");
    return maps.map((e) => DuaCategory.fromJson(e)).toList();
  }

  @override
  Future<List<Subtopic>> queryBookmarkedContent(List<String> ids) async {
    Database db = await database;
    List<Map> maps = await db.rawQuery("select Subtopic.topic_id, Subtopic.subtopic_id, Subtopic.name_en from Subtopic, Content where Content.rowid in (${ids.join(",")}) and Content.subtopic_id = Subtopic.subtopic_id and Content.topic_id = Subtopic.topic_id");
    return maps.map((e) => Subtopic.fromJson(e)).toList();
  }

  @override
  Future<List<ArabicSentence>> querySentenceByCategoryId(int allDuacategory_id) async {
    Database db = await database;
    List<Map> maps = await db.rawQuery("select * from Sentence where category_id=$allDuacategory_id");
    return maps.map((e) => ArabicSentence.fromJson(e)).toList();
  }

  @override
  Future<List<SentencesCategory>> queryAllSentenceCategories() async {
    Database db = await database;
    List<Map> maps = await db.rawQuery("select * from SentenceCategory");
    return maps.map((e) => SentencesCategory.fromJson(e)).toList();
  }
}
