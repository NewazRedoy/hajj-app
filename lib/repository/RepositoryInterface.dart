import 'package:hajjapp/model/ArabicSentences.dart';
import 'package:hajjapp/model/ArabicSentencesCategory.dart';
import 'package:hajjapp/model/Content.dart';
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/model/DuaDetail.dart';
import 'package:hajjapp/model/QuestionDetail.dart';
import 'package:hajjapp/model/QuestionsCategory.dart';
import 'package:hajjapp/model/SearchItem.dart';
import 'package:hajjapp/model/Subtopic.dart';
import 'package:hajjapp/model/Topic.dart';

enum PageViewType { Content, Dua, Question }

abstract class RepositoryInterface {
  Future<List<Content>> queryHadithsBySubtopicId(int topicID, int subtopicID);

  Future<List<Subtopic>> querySubtopicsByTopicId(int id);

  Future<List<SearchItem>> querybySearch(String term);

  Future<List<QuestionDetail>> queryQuestionsByCategoryId(int category_id);

  Future<List<QuestionCategory>> queryQuestionCategories();

  Future<List<Dua>> queryDuaByCategoryId(int allDuacategory_id);

  Future<List<DuaCategory>> queryAllDuaCategories();

  Future<List<DuaCategory>> queryFavDuas(List<String> ids);

  Future<List<ArabicSentence>> querySentenceByCategoryId(int allDuacategory_id);

  Future<List<SentencesCategory>> queryAllSentenceCategories();

  Future<List<Subtopic>> queryBookmarkedContent(List<String> ids);

//  Future<String> getTopicName(Topic topic){}
}
