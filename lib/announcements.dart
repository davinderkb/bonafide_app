import 'dart:ui';

class Announcement{
  String _title, _subjectLine, _description;
  Image _image;

    Announcement(this._title, this._subjectLine, this._description);

  Image get image => _image;

  get description => _description;

  get subjectLine => _subjectLine;

  String get title => _title;


  factory Announcement.fromJson(dynamic json) {

    return Announcement(json['title'] as String, json['subject_overline'] as String,json['description'] as String);
  }


}