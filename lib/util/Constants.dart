import 'package:first_app/model/ArabicSentences.dart';
import 'package:first_app/model/QuestionsSubTopic.dart';
import 'package:first_app/model/Topic.dart';

class Constants {
  static const String ROUTE_PRODUCT_DETAIL = "/productDetail";

  static const String ROUTE_LOGIN = "/productDetail";

  static const String ROUTE_HOME = "/productDetail";

  static const String ROUTE_SINGUP = "/productDetail";

  static var ROUTE_HADITH_LIST = "/booklist";

  static var ROUTE_BOOK_LIST = "/hadithlist";

  static List collections = [
    Topic(
        topic_id: 1,
        name: 'হজ্জ-উমরাহ পরিচিতি',
        desc_en: '',
        abbv: 'B',
        color: '#e65c60'),
    Topic(
        topic_id: 2,
        name: "হারাম সীমানা, মীকাত এবং ইহরাম",
        desc_en: '',
        abbv: 'M',
        color: '#e85d8b'),
    Topic(
        topic_id: 3,
        name: 'ধাপে ধাপে উমরাহ',
        desc_en: '',
        abbv: 'N',
        color: '#4859b5'),
    Topic(
        topic_id: 4,
        name: 'ধাপে ধাপে হজ্জ',
        desc_en: '',
        abbv: 'AD',
        color: '#5677fc'),
    Topic(
        topic_id: 5,
        name: 'সাবধান এবং সতর্কতা',
        desc_en: '',
        abbv: 'T',
        color: '#62c6f5'),
    Topic(
        topic_id: 6,
        name: 'ঐতিহাসিক স্থানসমূহ',
        desc_en: '',
        abbv: 'IM',
        color: '#3c968d'),
    Topic(
        topic_id: 7,
        name: 'প্রশ্নসমূহ',
        desc_en: '',
        abbv: 'MM',
        color: '#409c3e'),
    Topic(
        topic_id: 8,
        name: 'হজ্জ - উমরাহ সহায়ক',
        desc_en: '',
        abbv: 'A',
        color: '#8bc34a'),
  ];

  static List catechism = [
    QuestionSubtopic(
      question_id: 1,
      questiontopic: 'হজ্জ-উমরাহ পরিচিতি',
      answer: 'হজ্জ-উমরাহ পরিচিতি',
    ),
    QuestionSubtopic(
      question_id: 2,
      questiontopic: "হারাম সীমানা, মীকাত এবং ইহরাম",
      answer: 'হজ্জ-উমরাহ পরিচিতি',
    ),
    QuestionSubtopic(
      question_id: 3,
      questiontopic: 'ধাপে ধাপে উমরাহ',
      answer: 'হজ্জ-উমরাহ পরিচিতি',
    ),
    QuestionSubtopic(
      question_id: 4,
      questiontopic: 'ধাপে ধাপে হজ্জ',
      answer: 'হজ্জ-উমরাহ পরিচিতি',
    ),
    QuestionSubtopic(
      question_id: 5,
      questiontopic: 'সাবধান এবং সতর্কতা',
      answer: '',
    ),
    QuestionSubtopic(
      question_id: 6,
      questiontopic: 'ঐতিহাসিক স্থানসমূহ',
      answer: 'হজ্জ-উমরাহ পরিচিতি',
    ),
    QuestionSubtopic(
      question_id: 7,
      questiontopic: 'প্রশ্নসমূহ',
      answer: 'হজ্জ-উমরাহ পরিচিতি',
    ),
    QuestionSubtopic(
      question_id: 8,
      questiontopic: 'হজ্জ - উমরাহ সহায়ক',
      answer: 'হজ্জ-উমরাহ পরিচিতি',
    ),
  ];
  static List sentences = [
    ArabicSentences(
      topic_id: 1,
      bengali: "",
      arabic: "",
      pronunciation: "",
    ),
    ArabicSentences(
      topic_id: 2,
      bengali: "",
      arabic: "",
      pronunciation: "",
    ),
    ArabicSentences(
      topic_id: 3,
      bengali: "",
      arabic: "",
      pronunciation: "",
    ),
    ArabicSentences(
      topic_id: 4,
      bengali: "",
      arabic: "",
      pronunciation: "",
    ),
    ArabicSentences(
      topic_id: 5,
      bengali: "",
      arabic: "",
      pronunciation: "",
    ),
    ArabicSentences(
      topic_id: 6,
      bengali: "",
      arabic: "",
      pronunciation: "",
    ),
    ArabicSentences(
      topic_id: 7,
      bengali: "",
      arabic: "",
      pronunciation: "",
    ),
    ArabicSentences(
      topic_id: 8,
      bengali: "",
      arabic: "",
      pronunciation: "",
    ),
    ArabicSentences(
      topic_id: 9,
      bengali: "",
      arabic: "",
      pronunciation: "",
    ),
  ];
}
