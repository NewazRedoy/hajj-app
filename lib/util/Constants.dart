
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
        id: 1,
        name: 'হজ্জ-উমরাহ পরিচিতি',
        name_ar: '',
        abbv: 'B',
        color: '#e65c60'),
    Topic(
        id: 2,
        name: 'হারাম সীমানা, মীকাত এবং ইহরাম',
        name_ar: '',
        abbv: 'M',
        color: '#e85d8b'),
    Topic(
        id: 3,
        name: 'ধাপে ধাপে উমরাহ',
        name_ar: '',
        abbv: 'N',
        color: '#4859b5'),
    Topic(
        id: 4,
        name: 'ধাপে ধাপে হজ্জ',
        name_ar: '',
        abbv: 'AD',
        color: '#5677fc'),
    Topic(
        id: 5,
        name: 'সাবধান এবং সতর্কতা',
        name_ar: '',
        abbv: 'T',
        color: '#62c6f5'),
    Topic(
        id: 6,
        name: 'ঐতিহাসিক স্থান্সমূহ',
        name_ar: '',
        abbv: 'IM',
        color: '#3c968d'),
    Topic(
        id: 7,
        name: 'প্রশ্নসমূহ',
        name_ar: '',
        abbv: 'MM',
        color: '#409c3e'),
    Topic(
        id: 8,
        name: 'হজ্জ - উমরাহ সহায়ক',
        name_ar: '',
        abbv: 'A',
        color: '#8bc34a'),

  ];
}
