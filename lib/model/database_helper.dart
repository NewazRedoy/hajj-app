import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:first_app/model/GridList.dart';
// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "hajj.db";

  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;
}