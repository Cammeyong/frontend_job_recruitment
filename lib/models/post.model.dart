
import 'dart:io';

import 'package:frontend_job_recruitment/services/http.service.dart';

import '../tools/httpTools.dart';

const String _baseUrl = '/posts';
HTTP _http = HTTP();

class Post {
  String _id;
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

  factory Post.fromJson(Map<String, Object> source) => Post(
        source['_id'] as String,
        source['email'] as String,
        source['author'] as String,
        source['banner'] as File,
        source['position'] as String,
        source['requirements'] as String,
        source['tel'] as String,
        source['title'] as String,
        source['mailing_address'] as String,
      );

  static Future<Map<String, Object?>> get(String id) async =>
      await _http.get(Uri.parse('$_baseUrl/$id'));

  static Future<Map<String, Object?>> getMany(PagedFiltered pageFilter) async =>
      await _http.get(Uri.parse('$_baseUrl?${pageFilter.getQueryString()}'));

  static Future<Map<String, Object?>> save(Map<String, Object> source) async =>
      await _http.post(Uri.parse(_baseUrl), source);

  Future<Map<String, Object?>> update() async =>
      await _http.patch(Uri.parse('$_baseUrl/$_id'), toJson());

  Future<Map<String, Object?>> delete() async => await _http.delete(Uri.parse('$_baseUrl/$_id'));

  from(Map<String, Object> source) {
    _id = source['_id'] as String? ?? _id;
    _position = source['position'] as String? ?? _position;
    _requirements = source['requirements'] as String? ?? _requirements;
    _tel = source['tel'] as String? ?? _tel;
    _title = source['title'] as String? ?? _title;
    _mailingAddress = source['mailing_address'] as String? ?? _mailingAddress;
    _banner = source['banner'] as File? ?? _banner;
    _author = source['author'] as String? ?? _author;
    _email = source['email'] as String? ?? _email;
  }

  Map<String, Object> toJson() {
    return {
      '_id': _id,
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
