import 'dart:ui';

class UserData{
  String _name, _email;
  String _fixSalary,_basicSalary,_bonus;

  String get name => _name;
  String _compRate;

  UserData(this._name, this._email, this._fixSalary, this._basicSalary, this._bonus, this._compRate);




  factory UserData.fromJson(dynamic json) {

    return UserData(json['name'] as String, json['email'] as String, json['fix_salary'] as String, json['basic_salary'] as String,json['bonus'] as String,json['comp_ratio'] as String);
  }

  get email => _email;

  String get fixSalary => _fixSalary;

  get basicSalary => _basicSalary;

  get bonus => _bonus;

  String get compRate => _compRate;


}