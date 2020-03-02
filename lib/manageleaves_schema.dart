import 'dart:ui';

import 'package:intl/intl.dart';

class ManageLeavesSchema{
  String _fromdate, _toDate, _reason, _status,_id;
  ManageLeavesSchema(this._id, this._fromdate, this._toDate, this._reason, this._status);

  get fromDate => _fromdate;

  get toDate => _toDate;

  get fromToDate => _fromdate==_toDate? _fromdate: "$_fromdate - $toDate";

  String get status => _status;

  String get reason => _reason;
  String get id => _id;


  factory ManageLeavesSchema.fromJson(dynamic json) {

    return ManageLeavesSchema(json['id'] as String, DateFormat("MMM dd, yyyy").format(DateTime.parse(json['from_date'])), DateFormat("MMM dd, yyyy").format(DateTime.parse(json['to_date'])),json['reason'] as String, json['status'] as String);
  }


}