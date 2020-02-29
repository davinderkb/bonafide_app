import 'dart:ui';

import 'package:intl/intl.dart';

class TimesheetEntry {
  String _date, _duration, _day;

  String get day => _day;


  TimesheetEntry(_date, _duration){
    if(_date != null && (_date != "" || _date!= " ")) {
      this._day = parseDay(DateTime.parse(_date).weekday);
      this._date = DateFormat("MMM dd, yyyy").format(DateTime.parse(_date));
    } else{
      this._date = _date;
    }
    if(_duration != null && (_duration != "" || _duration!= " ")) {
      var durationSplit = _duration.toString().split(":");
      this._duration = durationSplit[0].length==1
          ? "0"+durationSplit[0] +":"+durationSplit[1]
          : durationSplit[0] + ":"+durationSplit[1];
    }else{
      this._duration = _duration;
    }
  }

  String parseDay(int dayValue) {
    switch(dayValue) {
      case 1:
        return "Mon ,";
      case 2:
        return "Tue ,";
      case 3:
        return "Wed ,";
      case 4:
        return "Thu ,";
      case 5:
        return "Fri ,";
      case 6:
        return "Sat ,";
      case 7:
        return "Sun ,";

      default: return "";
    }
  }

    get duration => _duration;

    set duration(value) {
      _duration = value;
    }

    String get date => _date;

    set date(String value) {
      _date = value;
    }
  }


