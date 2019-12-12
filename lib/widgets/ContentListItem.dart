import 'package:first_app/model/Content.dart';
import 'package:flutter/material.dart';

class ContentListItem extends StatelessWidget {
  Content hadith;

  ContentListItem({this.hadith});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4.0,
        child: InkWell(
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(hadith.hadithId.toString()),
                        Text(hadith.gradeEn)
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      hadith.textAr,
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 22, fontFamily: 'Quran'),
                    ),
                    SizedBox(height: 6),
                    Text(
                      hadith.textEn,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    SizedBox(height: 6),
                    Text(
                      hadith.referenceEn,
                      style: TextStyle(fontSize: 12),
                    )
                  ])),
        ),
      ),
    );
  }
}
