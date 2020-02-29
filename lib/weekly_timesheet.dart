
import 'package:bonafide_app/timesheet_entry.dart';
import 'package:intl/intl.dart';

class WeeklyTimesheet{
  String _startDate, _endDate, _preUrl, _nextUrl;

  String get startDate => _startDate;

  set startDate(String value) {
    if(value != null && (value != "" || value!= " ")) {
      this._startDate = DateFormat("MMM dd, yyyy").format(DateTime.parse(value));
    }else {
      _startDate = value;
    }
  }

  List<TimesheetEntry> _weekEntries;

  get endDate => _endDate;

  set endDate(value) {
    if(value != null && (value != "" || value!= " ")) {
      this._endDate = DateFormat("MMM dd, yyyy").format(DateTime.parse(value));
    } else {
      _endDate = value;
    }
  }

  get preUrl => _preUrl;

  set preUrl(value) {
    _preUrl = value;
  }

  get nextUrl => _nextUrl;

  set nextUrl(value) {
    _nextUrl = value;
  }

  List<TimesheetEntry> get weekEntries => _weekEntries;

  set weekEntries(List<TimesheetEntry> value) {
    _weekEntries = value;
  }
}