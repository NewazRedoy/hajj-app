
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
        name: 'Sahih Bukhari',
        name_ar: 'صحيح البخاري',
        abbv: 'B',
        color: '#e65c60'),
    Topic(
        id: 2,
        name: 'Sahih Muslim',
        name_ar: 'صحيح مسلم',
        abbv: 'M',
        color: '#e85d8b'),
    Topic(
        id: 3,
        name: 'Sunan an-Nasai',
        name_ar: 'سنن النسائي',
        abbv: 'N',
        color: '#4859b5'),
    Topic(
        id: 4,
        name: 'Abu Dawood',
        name_ar: 'سنن أبي داود',
        abbv: 'AD',
        color: '#5677fc'),
    Topic(
        id: 5,
        name: 'Jamiat Tirmidhi',
        name_ar: 'جامع الترمذي',
        abbv: 'T',
        color: '#62c6f5'),
    Topic(
        id: 6,
        name: 'Sunan Ibn Majah',
        name_ar: 'سنن ابن ماجه',
        abbv: 'IM',
        color: '#3c968d'),
    Topic(
        id: 7,
        name: 'Muwatta Malik',
        name_ar: 'موطأ مالك',
        abbv: 'MM',
        color: '#409c3e'),
    Topic(
        id: 8,
        name: 'MusnadAhmed',
        name_ar: 'مسند أحمد',
        abbv: 'A',
        color: '#8bc34a'),
    Topic(
        id: 9,
        name: 'Riyad us Saliheen',
        name_ar: 'رياض الصالحين',
        abbv: 'RS',
        color: '#cedb58'),
    Topic(
        id: 10,
        name: 'Shamail Muhammadiyah',
        name_ar: 'الشمائل المحمدية',
        abbv: 'SM',
        color: '#ffd966'),
    Topic(
        id: 11,
        name: 'Al-Adab Al-Mufrad',
        name_ar: 'الأدب المفرد',
        abbv: 'AM',
        color: '#ffb566'),
    Topic(
        id: 12,
        name: 'Bulugh Al Maram',
        name_ar: 'بلوغ المرام',
        abbv: 'BM',
        color: '#ff8a66'),
    Topic(
        id: 13,
        name: 'Nawawi Hadith',
        name_ar: 'الأربعون النووية',
        abbv: 'NH',
        color: '#b36447'),
    Topic(
        id: 14,
        name: 'Hadith Qudsi',
        name_ar: 'الحديث القدسي',
        abbv: 'HQ',
        color: '#999999'),
  ];
}
