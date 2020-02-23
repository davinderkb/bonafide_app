import 'dart:ui';

class ManageLeavesSchema{
  String _fromdate, _toDate, _reason, _status,_id;
  ManageLeavesSchema(this._id, this._fromdate, this._toDate, this._reason, this._status);

  get fromDate => _fromdate;

  get toDate => _toDate;

  String get status => _status;

  String get reason => _reason;
  String get id => _id;


  factory ManageLeavesSchema.fromJson(dynamic json) {

    return ManageLeavesSchema(json['id'] as String, json['from_date'] as String, json['to_date'] as String,json['reason'] as String, json['status'] as String);
  }


}