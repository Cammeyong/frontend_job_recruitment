import 'dart:io';
import 'package:dio/dio.dart';
import 'package:frontend_job_recruitment/services/http.service.dart';

import '../services/httpTools.dart';

HTTP _http = HTTP();
const String _baseUrl = '/posts';

class Post {
  String _id;
  String _title;
  String _banner;
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

  factory Post.fromJson(Map<String, Object?> source) => Post(
        source['_id'] as String,
        source['email'] as String,
        source['author'] as String,
        source['banner'] as String,
        source['position'] as String,
        source['requirements'] as String,
        source['tel'] as String,
        source['title'] as String,
        source['mailing_address'] as String,
      );

  static Future<Map<String, dynamic>?> get(String id) async =>
      await _http.get(Uri.parse('$_baseUrl/$id'));

  static Future<Map<String, dynamic>?> getMany(PagedFiltered pageFilter) async =>
      await _http.get(Uri.parse('$_baseUrl?${pageFilter.getQueryString()}'));

  static Future<Map<String, dynamic>?> save(Map<String, Object> source) async {
    source['image'] = await MultipartFile.fromFile(source['image'] as String);
    source['clip'] = await MultipartFile.fromFile(source['clip'] as String);
    return await _http.postFD(Uri.parse(_baseUrl), FormData.fromMap(source));
  }

  Future<Map<String, dynamic>?> update() async {
    var source = toJson();
    source['image'] = File(source['image'] as String);
    source['clip'] = File(source['clip'] as String);
    return await _http.patchFD(Uri.parse('$_baseUrl/$_id'), FormData.fromMap(source));
  }

  Future<Map<String, dynamic>?> delete() async => await _http.delete(Uri.parse('$_baseUrl/$_id'));

  from(Map<String, Object?> source) {
    _position = source['position'] as String;
    _requirements = source['requirements'] as String;
    _tel = source['tel'] as String;
    _title = source['title'] as String;
    _mailingAddress = source['mailing_address'] as String;
    _banner = source['banner'] as String;
    _author = source['author'] as String;
    _email = source['email'] as String;
    _id = source['_id'] as String;
  }

  Map<String, Object?> toJson() {
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
