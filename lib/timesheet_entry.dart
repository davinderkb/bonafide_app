import 'dart:ui';

import 'package:intl/intl.dart';

class TimesheetEntry {
  String _date, _duration, _day;
  String get day => _day;


  TimesheetEntry(_date, _duration, isFormatConversionReqd){
    if( isFormatConversionReqd && (_date != null && (_date != "" || _date!= " "))) {
      this._day = parseDay(DateTime.parse(_date).weekday);
      this._date = DateFormat("MMM dd, yyyy").format(DateTime.parse(_date));
    } else{
      this._date = _date;
    }
    if(isFormatConversionReqd && (_duration != null && (_duration != "" || _duration!= " "))) {
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

  String parseMonth(String month) {
    switch (month) {
      case "Jan":
        return "01";
      case "Feb":
        return "02";
      case "Mar":
        return "03";
      case "Apr":
        return "04";
      case "May":
        return "05";
      case "Jun":
        return "06";
      case "Jul":
        return "07";
      case "Aug":
        return "08";
      case "Sep":
        return "09";
      case "Oct":
        return "10";
      case "Nov":
        return "11";
      case "Dec":
        return "12";
      default:
        return "";
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

  Map<String, dynamic> toJson() => {'"date"': '"'+parseStringDateToDbFormat(_date)+'"', '"time"': '"'+_duration+'"'};

  String parseStringDateToDbFormat(String date)  {
      String dateInDbFormat = date.split(" ")[2] +"-" + parseMonth(date.split(" ")[0]) +"-" +date.split(" ")[1].split(',')[0];
      return dateInDbFormat;
    }
}


