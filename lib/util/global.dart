// bool isInt(String val) => val is int || val == val.roundToDouble();

class Localise {
// translate number
  static String fromString(dynamic i) {
    var o = '';
    var s = '$i';


    for (var i = 0; i < s.length; i++) {
      int ch = s.codeUnitAt(i);
      if (ch < '\u09E6'.codeUnitAt(0) && !list.contains(ch)) {
        ch += bnDiff;
      }
      o += String.fromCharCode(ch);
    }

    return o;
  }
}

final list = ['-'.codeUnitAt(0), '+'.codeUnitAt(0), ':'.codeUnitAt(0), '.'.codeUnitAt(0)];
final bnDiff = '\u09E6'.codeUnitAt(0) - '0'.codeUnitAt(0);

String __(String s) {}
