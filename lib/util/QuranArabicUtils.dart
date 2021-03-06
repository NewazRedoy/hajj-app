import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuranArabicUtils {
  static final RegExp arabicmatcher = RegExp(r"[\u0600-\u06FF :]{3,}");

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

  static List<TextSpan> highlightArabic(String source, TextStyle style) {
    if (source == null) {
      return [TextSpan(text: source ?? "")];
    }

    List<Match> matches = [];
    matches.addAll(QuranArabicUtils.arabicmatcher.allMatches(source));

    if (matches.isEmpty) {
      return [TextSpan(text: source)];
    }
    matches.sort((a, b) => a.start.compareTo(b.start));

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

  static List<Widget> highlightArabicWidget(String source, TextStyle style) {
    if (source == null) {
      return [Text(source ?? "")];
    }

    List<Match> matches = [];
    matches.addAll(QuranArabicUtils.arabicmatcher.allMatches(source));

    if (matches.isEmpty) {
      return [Text(source)];
    }
    matches.sort((a, b) => a.start.compareTo(b.start));

    int lastMatchEnd = 0;
    final List<Text> children = [];
    for (final match in matches) {
      if (match.end <= lastMatchEnd) {
        // already matched -> ignore
      } else if (match.start <= lastMatchEnd) {
        children.add(Text(
          source.substring(lastMatchEnd, match.end),
          style: style,
          textDirection: TextDirection.rtl,
        ));
      } else if (match.start > lastMatchEnd) {
        children.add(Text(
          source.substring(lastMatchEnd, match.start),
        ));

        children.add(Text(
          source.substring(match.start, match.end),
          style: style,
          textDirection: TextDirection.rtl,
        ));
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }

    if (lastMatchEnd < source.length) {
      children.add(Text(
        source.substring(lastMatchEnd, source.length),
      ));
    }

    return children;
  }
}
