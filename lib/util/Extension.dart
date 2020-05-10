extension NumberParsing on String {
  String toBangla() {
    return n(this);
  }

}


// translate number
String n(dynamic i) {
  var o = '';
  var s = '$i';

  for (var i = 0; i < s.length; i++) {
    int ch = s.codeUnitAt(i);
    if (ch < '\u09E6'.codeUnitAt(0) && ch != '-'.codeUnitAt(0) && ch != '+'.codeUnitAt(0) && ch != ':'.codeUnitAt(0) && ch != '.'.codeUnitAt(0)) {
      ch += '\u09E6'.codeUnitAt(0) - '0'.codeUnitAt(0);
    }
    o += ch.toString();
  }

  return o;
}

