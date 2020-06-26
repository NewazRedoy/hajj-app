import 'package:hajjapp/model/DuaTopic.dart';
import 'package:hajjapp/model/Topic.dart';

class Constants {
  static const String ROUTE_LOGIN = "/productDetail";

  static const String ROUTE_SINGUP = "/signup";

  static List topics = [
    Topic(topic_id: 1, name: 'হজ্জ-উমরাহ পরিচিতি',),
    Topic(topic_id: 2, name: "হারাম সীমানা, মীকাত এবং ইহরাম", ),
    Topic(topic_id: 5, name: 'সাবধানতা এবং সতর্কতা',),
    Topic(topic_id: 6, name: 'ঐতিহাসিক স্থানসমূহ',),
    Topic(topic_id: 8, name: 'তাওয়াফ গণনা',),
    Topic(topic_id: 9, name: "সা'ঈ গণনা",),
    Topic(topic_id: 10, name: 'রিয়াল-টাকা কনভার্টার',),
    Topic(topic_id: 11, name: 'কিছু আরবী বাক্য',),
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
}
