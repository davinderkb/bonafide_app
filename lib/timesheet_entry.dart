import 'dart:ui';

class TimesheetEntry {
  String _date, _duration;
  TimesheetEntry(this._date, this._duration);

  get duration => _duration;

  set duration(value) {
    _duration = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }


}