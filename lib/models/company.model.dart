import 'dart:io';

import 'package:frontend_job_recruitment/services/http.service.dart';

import '../tools/httpTools.dart';

const String _baseUrl = '/companies';
HTTP _http = HTTP();

class Company {
  String _id;
  String _name;
  String _email;
  String _password;
  String _address;
  File _logo;
  File _certificate;

  Company(
    this._id,
    this._email,
    this._password,
    this._name,
    this._address,
    this._certificate,
    this._logo,
  );

  factory Company.fromJson(Map<String, Object?> source) => Company(
        source['_id'] as String,
        source['email'] as String,
        source['password'] as String,
        source['name'] as String,
        source['address'] as String,
        source['certificate'] as File,
        source['logo'] as File,
      );

  static Future<Map<String, Object?>> signUp(Map<String, Object?> source) async =>
      await _http.post(Uri.parse(_baseUrl), source);

  static Future<Company> signIn(Map<String, Object?> source) async =>
      Company.fromJson(await _http.post(Uri.parse('$_baseUrl/login'), source));

  Future<Map<String, Object?>> session() async => await _http.get(Uri.parse(_baseUrl));

  Future<Map<String, Object?>> logOut() async => await _http.delete(Uri.parse('/logout'));

  static Future<Map<String, Object?>> get(PagedFiltered pageFilter) async =>
      await _http.get(Uri.parse('$_baseUrl?${pageFilter.getQueryString()}'));

  Future<Map<String, Object?>> delete() async => await _http.delete(Uri.parse(_baseUrl));

  Future<Map<String, Object?>> update() async => await _http.patch(Uri.parse(_baseUrl), toJson());

  from(Map<String, Object?> source) {
    _password = source['password'] as String? ?? _password;
    _name = source['name'] as String? ?? _name;
    _email = source['email'] as String? ?? _email;
    _id = source['id'] as String? ?? _id;
    _logo = source['logo'] as File? ?? _logo;
    _certificate = source['certificate'] as File? ?? _certificate;
    _address = source['address'] as String? ?? _address;
  }

  Map<String, Object?> toJson() {
    return {
      'address': _address,
      'certificate': _certificate,
      'logo': _logo,
      '_id': _id,
      'email': _email,
      'name': _name,
      'password': _password,
    };
  }
}
