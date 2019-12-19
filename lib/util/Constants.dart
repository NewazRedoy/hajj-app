import 'package:first_app/model/ArabicSentences.dart';
import 'package:first_app/model/QuestionsCategory.dart';
import 'package:first_app/model/QuestionsSubTopic.dart';
import 'package:first_app/model/Topic.dart';
import 'package:first_app/model/ArabicSentencesCategory.dart';
import 'package:first_app/model/DuaTopic.dart';

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
        color: '#e65c60'),
    Topic(
        topic_id: 2,
        name: "হারাম সীমানা, মীকাত এবং ইহরাম",
        color: '#e85d8b'),
    Topic(
        topic_id: 3,
        name: 'ধাপে ধাপে উমরাহ',
        color: '#4859b5'),
    Topic(
        topic_id: 4,
        name: 'ধাপে ধাপে হজ্জ',
        color: '#5677fc'),
    Topic(
        topic_id: 5,
        name: 'সাবধান এবং সতর্কতা',
        color: '#62c6f5'),
    Topic(
        topic_id: 6,
        name: 'ঐতিহাসিক স্থানসমূহ',
        color: '#3c968d'),
    Topic(
        topic_id: 7,
        name: 'প্রশ্নসমূহ',
        color: '#409c3e'),
    Topic(
        topic_id: 8,
        name: 'হজ্জ - উমরাহ সহায়ক',
        color: '#8bc34a'),
  ];
  static List dua_categories = [
    DuaTopic(
        duatopic_id:1,
        duatopic: "সব দু'আ",
    ),
    DuaTopic(
      duatopic_id:2,
      duatopic: "আমার দু'আ",
    ),
    DuaTopic(
      duatopic_id:3,
      duatopic: "পছন্দ তালিকা",
    ),
  ];
  static List question_categories = [
    QuestionCategory(
      category_id: 1,
      questiontopic: 'ইহরাম',
    ),
    QuestionCategory(
      category_id: 2,
      questiontopic: "মীকাত",
    ),
    QuestionCategory(
      category_id: 3,
      questiontopic: "হজ্জ বিষয়ক",
    ),
    QuestionCategory(
      category_id: 4,
      questiontopic: "উমরাহ বিষয়ক",
    ),

  ];

  static List catechism = [
    QuestionSubtopic(
      category_id: 1,
      question_id: 1,
      questiontopic: 'ইহরামের কাপড় পরিধানের পূর্বে সুগন্ধি মাখা মুস্তাহাব । কিন্তু এই সুগন্ধি কোথায় মাখতে হবে?',
      answer: 'মাথায়, দাড়িতে ও শরীরে মাখা যায় । ইহরাম পরিধানের পর যদি এর সুগন্ধ শরীরে থেকে যায় তাতে কোন অসুবিধা নেই । মনে রাখতে হবে, মেয়েরা সুগন্ধি লাগাবে না ।',
    ),
    QuestionSubtopic(
      category_id: 1,
      question_id: 2,
      questiontopic: "৩৬-ইহরামের ওয়াজিব কয়টি ও কী কী?",
      answer: "৩টি যথা : (১) মীকাত থেকে ইহরাম বাঁধা ।(২) সেলাইবিহীন কাপড় পরিধান করা ।(৩) তালবিয়াহ পাঠ করা । অর্থাৎ নিয়ত করার পর তালবিয়াহ পাঠ করা ওয়াজিব ।",
    ),
    QuestionSubtopic(
      category_id: 1,
      question_id: 3,
      questiontopic: 'বাংলাদেশ থেকে গমনকারী লোকেরা যদি নিজ বাড়ি বা ঢাকা এয়ারপোর্ট থেকে ইহরাম পরে তবে কি তা জায়েয?',
      answer: 'হ্যাঁ, তা জায়েয আছে । ইহরাম কাপড় মীকাত থেকে পরা সুন্নাত হলেও বিমান বা যানবাহনে উঠার আগেই গোসল করে ইহরামের কাপড় পরে নিতে পারেন । তবে নিয়ত করা উচিৎ মিকাতে পৌঁছে বা এর পূর্বক্ষণে ।',
    ),
  ];
  static List sentense_categories =[
    SentencesCategory(
        sentencecategory_id: 1,
      sentencetopic: "যাতায়াত বিষয়ক",
    ),
    SentencesCategory(
      sentencecategory_id: 2,
      sentencetopic: "দাম দর এবং পণ্য সম্পর্কিত",
    ),
    SentencesCategory(
      sentencecategory_id: 3,
      sentencetopic: " জরুরী বিষয়",
    ),
    SentencesCategory(
      sentencecategory_id: 4,
      sentencetopic: "হজ বিষয়ক",
    ),
  ];
  static List sentences = [
    ArabicSentences(
      topic_id: 1,
      sentencecategory_id:1,
      bengali: "আমাকে হোটেলের রাস্তাটি দেখিয়ে দিন",
      arabic: "أرني الطريق إلى الفندق",
      pronunciation: " এখানে আরবির উচ্চারণটা থাকবে",
    ),
    ArabicSentences(
      topic_id: 2,
      sentencecategory_id:1,
      bengali: "আমাকে হোটেলের রাস্তাটি দেখিয়ে দিন",
      arabic: "أرني الطريق إلى الفندق",
      pronunciation: " এখানে আরবির উচ্চারণটা থাকবে",
    ),
    ArabicSentences(
      topic_id: 3,
      sentencecategory_id:1,
      bengali: "আমাকে হোটেলের রাস্তাটি দেখিয়ে দিন",
      arabic: "أرني الطريق إلى الفندق",
      pronunciation: " এখানে আরবির উচ্চারণটা থাকবে",
    ),
    ArabicSentences(
      topic_id: 4,
      sentencecategory_id:1,
      bengali: "আমাকে হোটেলের রাস্তাটি দেখিয়ে দিন",
      arabic: "أرني الطريق إلى الفندق",
      pronunciation: " এখানে আরবির উচ্চারণটা থাকবে",
    ),

  ];
}
