import 'package:intl/intl.dart';

class Picture {
  DateTime date;
  String explanation;
  String hdurl;
  String title;
  String url;
  String copyright;
  Picture(
      {this.date,
      this.explanation,
      this.hdurl,
      this.title,
      this.url,
      this.copyright});

  factory Picture.fromJson(Map<String, dynamic> map) {
    return Picture(
        date: DateFormat('yyyy-MM-dd').parse(map['date']),
        explanation: map['explanation'],
        hdurl: map['hdurl'],
        title: map['title'],
        url: map['url'],
        copyright: map['copyright']);
  }
}
