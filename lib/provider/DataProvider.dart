// needed for Directory()
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hajjapp/model/ArabicSentences.dart';
import 'package:hajjapp/model/ArabicSentencesCategory.dart';
import 'package:hajjapp/model/Content.dart';
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/model/DuaDetail.dart';
import 'package:hajjapp/model/QuestionDetail.dart';
import 'package:hajjapp/model/QuestionsCategory.dart';
import 'package:hajjapp/model/SearchItem.dart';
import 'package:hajjapp/model/Subtopic.dart';
import 'package:hajjapp/repository/LocalRepository.dart';
import 'package:hajjapp/repository/RepositoryInterface.dart';
import 'package:provider/provider.dart';

// singleton class to manage the database
class DataProvider extends ChangeNotifier implements RepositoryInterface{
  // This is the actual database filename that is saved in the docs directory.

  var dbLoading = true;

  RepositoryInterface repository;

  DataProvider() {
    repository = LocalRepository();
    dbLoading = false;

    notifyListeners();
  }

  static DataProvider of(BuildContext context) {
    return Provider.of<DataProvider>(context, listen: false);
  }

  @override
  Future<List<DuaCategory>> queryAllDuaCategories() {
    return repository.queryAllDuaCategories();
  }

  @override
  Future<List<SentencesCategory>> queryAllSentenceCategories() {
   return repository.queryAllSentenceCategories();
  }

  @override
  Future<List<Dua>> queryDuaByCategoryId(int allDuacategory_id) {
    return repository.queryDuaByCategoryId(allDuacategory_id);
  }

  @override
  Future<List<DuaCategory>> queryFavDuas(List<String> ids) {
    return repository.queryFavDuas(ids);
  }

  @override
  Future<List<Content>> queryBookmarkedContent(List<String> ids) {
    return repository.queryBookmarkedContent(ids);
  }

  @override
  Future<List<Content>> queryHadithsBySubtopicId(int topicID, int subtopicID) {
    return repository.queryHadithsBySubtopicId(topicID, subtopicID);
  }

  @override
  Future<List<QuestionCategory>> queryQuestionCategories() {
    return repository.queryQuestionCategories();
  }

  @override
  Future<List<QuestionDetail>> queryQuestionsByCategoryId(int category_id) {
    return repository.queryQuestionsByCategoryId(category_id);
  }

  @override
  Future<List<ArabicSentence>> querySentenceByCategoryId(int allDuacategory_id) {
    return repository.querySentenceByCategoryId(allDuacategory_id);
  }

  @override
  Future<List<Subtopic>> querySubtopicsByTopicId(int id) {
    return repository.querySubtopicsByTopicId(id);
  }

  @override
  Future<List<SearchItem>> querybySearch(String term) {
    return repository.querybySearch(term);
  }
}
