import 'package:flutter/material.dart';
import 'package:first_app/widgets/ListPageItem.dart';
 class QueAns extends StatefulWidget {
   @override
   _QueAnsState createState() => _QueAnsState();
 }

 class _QueAnsState extends State<QueAns> {
   hexColor(String colorCode) {
     String colorNew = '0xff' + colorCode;
     colorNew = colorNew.replaceAll('#', '');
     int colorInt = int.parse(colorNew);
     return colorInt;
   }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           title: Text("Hajj App-guide"),
           backgroundColor: Color(hexColor('4F7491')),
         ),
         body: Column(
               children: <Widget>[
                 ListView.builder(
                   itemCount: 1,
                   itemBuilder: (context, index) {
                     return ListPageItem(index, 'text');
                   },
                 ),
                Center(
                  child: Container(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                        2, (index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () {
                              },
                              child: Column(mainAxisSize: MainAxisSize.min, children: [
                                Text( "নির্বাচিত প্রশ্নোত্তর"

                                ),
                                Text("প্রশ্ন করুন",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ]),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

               ],
         )
     );
   }
 }
