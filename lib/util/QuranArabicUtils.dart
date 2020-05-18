import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FontFamily.dart';

class QuranArabicUtils {
  static final RegExp arabicmatcher = RegExp("[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FF]+");

  static bool containArabic(String s) {
    if (s == null) {
      return false;
    }
    String textWithoutSpace = s.trim().replaceAll(" ", ""); //to ignore whitespace

    int length = textWithoutSpace.length;
    for (int i = 0; i < length; i++) {
      int current = textWithoutSpace.codeUnitAt(i);

      // non-reshaped arabic
      if ((current >= 1570) && (current <= 1610))
        return true;

      // re-shaped arabic
      else if ((current >= 65133) && (current <= 65276))
        return true;

      // (42 is a * which is useful in searching sqlite, it deserves another chance :p)
      else if (current != 42) return false;
    }
    return false;
  }

  static List<TextSpan> highlightArabic(String source) {
    if (source == null) {
      return [TextSpan(text: source ?? "")];
    }

    List<Match> matches = [];
    matches.addAll(QuranArabicUtils.arabicmatcher.allMatches(source));

    if (matches.isEmpty) {
      return [TextSpan(text: source)];
    }
    matches.sort((a, b) => a.start.compareTo(b.start));

    var style = TextStyle(
      color: Colors.red,
      fontFamily: FontFamily.arabic,
    );

    int lastMatchEnd = 0;
    final List<TextSpan> children = [];
    for (final match in matches) {
      if (match.end <= lastMatchEnd) {
        // already matched -> ignore
      } else if (match.start <= lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.end),
          style: style,
        ));
      } else if (match.start > lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));

        children.add(TextSpan(
          text: source.substring(match.start, match.end),
          style: style,
        ));
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }

    if (lastMatchEnd < source.length) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, source.length),
      ));
    }

    return children;
  }
}
