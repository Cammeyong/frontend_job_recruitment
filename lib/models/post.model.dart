import 'dart:io';

import 'package:frontend_job_recruitment/services/http.service.dart';

class Post {
  String? _id;
  String _title;
  File _banner;
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

  factory Post.from(Map<String, dynamic> source) => Post(
        source['_id'],
        source['email'],
        source['author'],
        source['banner'],
        source['position'],
        source['requirements'],
        source['tel'],
        source['title'],
        source['mailing_address'],
      );

  HTTP http = HTTP();
  final String baseUrl = '/posts';

  static get(String id) async => await HTTP().get(Uri.parse('/posts/$id'));

  static getAll() async => await HTTP().get(Uri.parse('/posts'));

  static save(Map<String, dynamic> source) async =>
      await HTTP().post(Uri.parse('/posts'), source);

  update() async => await http.patch(Uri.parse('$baseUrl/$_id'), _to());

  delete() async => await http.delete(Uri.parse('$baseUrl/$_id'));

  _from(Map<String, dynamic> source) {
    _position = source['position'];
    _requirements = source['requirements'];
    _tel = source['tel'];
    _title = source['title'];
    _mailingAddress = source['mailing_address'];
    _banner = source['banner'];
    _author = source['author'];
    _email = source['email'];
    _id = source['_id'];
  }

  Map<String, dynamic> _to() {
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
