import 'package:hajjapp/model/ArabicSentences.dart';
import 'package:hajjapp/model/ArabicSentencesCategory.dart';
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/model/DuaDetail.dart';
import 'package:hajjapp/model/DuaTopic.dart';
import 'package:hajjapp/model/QuestionDetail.dart';
import 'package:hajjapp/model/QuestionsCategory.dart';
import 'package:hajjapp/model/Topic.dart';

class Constants {
  static const String ROUTE_PRODUCT_DETAIL = "/productDetail";

  static const String ROUTE_LOGIN = "/productDetail";

  static const String ROUTE_HOME = "/productDetail";

  static const String ROUTE_SINGUP = "/productDetail";

  static var ROUTE_HADITH_LIST = "/subtopiclist";

  static List topics = [
    Topic(topic_id: 1, name: 'হজ্জ-উমরাহ পরিচিতি', color: '#e65c60'),
    Topic(topic_id: 2, name: "হারাম সীমানা, মীকাত এবং ইহরাম", color: '#e85d8b'),
    Topic(topic_id: 3, name: 'ধাপে ধাপে উমরাহ', color: '#4859b5'),
    Topic(topic_id: 4, name: 'ধাপে ধাপে হজ্জ', color: '#5677fc'),
    Topic(topic_id: 5, name: 'সাবধান এবং সতর্কতা', color: '#62c6f5'),
    Topic(topic_id: 6, name: 'ঐতিহাসিক স্থানসমূহ', color: '#3c968d'),
    Topic(topic_id: 7, name: 'প্রশ্নসমূহ', color: '#409c3e'),
    Topic(topic_id: 8, name: 'তাওয়াফ গণনা', color: '#409c3e'),
    Topic(topic_id: 9, name: "সা'ঈ গণনা", color: '#409c3e'),
    Topic(topic_id: 10, name: 'রিয়াল- টাকা কানভার্টার', color: '#409c3e'),
    Topic(topic_id: 11, name: 'কিছু আরবী বাক্য', color: '#409c3e'),
  ];

  static List dua_categories = [
    DuaTopic(
      duatopic_id: 1,
      duatopic: "সব দু'আ",
    ),
    DuaTopic(
      duatopic_id: 2,
      duatopic: "আমার দু'আ",
    ),
    DuaTopic(
      duatopic_id: 3,
      duatopic: "পছন্দ তালিকা",
    ),
  ];


//  public static String intToBangla(int n) {
//    var buffer = new StringBuffer(n.toString());
//
//    buffer.write("Hello");
//    buffer.write("world");
//    for (int i = 0; i < sb.length(); i++) {
//      int ch = sb.charAt(i);
//      if (ch >= '\u09E6'.codeUnitAt(0) || ch == '-' || ch == '+' || ch == ':' || ch == '.')
//        continue; // if already bangla then no need
//      ch += '\u09E6' - '0';
//      buffer.write ch);
//
//    }
//    return sb.toString();
//  }

}
