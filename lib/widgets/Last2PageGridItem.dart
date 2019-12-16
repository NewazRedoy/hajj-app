import 'package:first_app/model/Subtopic.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screen/SubTopicListPage.dart';
import 'package:first_app/screen/RiyalTakaConverterPage.dart';
import 'package:first_app/screen/SieCountPage.dart';

class Last2PageGridItem extends StatelessWidget {
  int index;
  Subtopic subtopic;

  Last2PageGridItem(this.index, this.subtopic,);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 7.0,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              if (subtopic.subtopic_id > 0 ) {
                return SubtopicListPage();
              } else if (subtopic.subtopic_id == 4 ) {
                return RiyalConverter();
              } else {
                return SaiCount();
              }
            }));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Text(subtopic.name_en),
            ],
          ),
        ),
      ),
    );
  }
}
