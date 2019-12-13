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
        name: 'হারাম সীমানা, মীকাত এবং ইহরাম',
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
}
