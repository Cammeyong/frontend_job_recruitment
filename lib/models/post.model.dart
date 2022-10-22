import 'dart:io';

import 'package:frontend_job_recruitment/services/http.service.dart';

class Post {
  String? _id;
  String _title;
  Object? _banner;
  String _position;
  String _requirements;
  String _tel;
  String _email;
  String _mailingAddress;
  String _author;

  Post(
    this._id,
    this._email,
    this._author,
    this._banner,
    this._position,
    this._requirements,
    this._tel,
    this._title,
    this._mailingAddress,
  );

  factory Post.from(Map<String, Object?> source) => Post(
        source['_id'] as String,
        source['email'] as String,
        source['author'] as String,
        source['banner'],
        source['position'] as String,
        source['requirements'] as String,
        source['tel'] as String,
        source['title'] as String,
        source['mailing_address'] as String,
      );

  HTTP http = HTTP();
  final String baseUrl = '/posts';

  static get(String id) async => await HTTP().get(Uri.parse('/posts/$id'));

  static getAll() async => await HTTP().get(Uri.parse('/posts'));

  static save(Map<String, Object?> source) async =>
      await HTTP().post(Uri.parse('/posts'), source);

  update() async => await http.patch(Uri.parse('$baseUrl/$_id'), _to());

  delete() async => await http.delete(Uri.parse('$baseUrl/$_id'));

  _from(Map<String, Object?> source) {
    _position = source['position'] as String;
    _requirements = source['requirements'] as String;
    _tel = source['tel'] as String;
    _title = source['title'] as String;
    _mailingAddress = source['mailing_address'] as String;
    _banner = source['banner'];
    _author = source['author'] as String;
    _email = source['email'] as String;
    _id = source['_id'] as String;
  }

  Map<String, Object?> _to() {
    return {
      'email': _email,
      'author': _author,
      'banner': _banner,
      'mailing_address': _mailingAddress,
      'title': _title,
      'tel': _tel,
      'requirement': _requirements,
      'position': _position,
    };
  }
}
