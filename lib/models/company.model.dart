import 'dart:convert';

import 'package:frontend_job_recruitment/services/http.service.dart';

class Company {
  String? _id;
  String _name;
  String _email;
  String _password;
  String _address;
  Object? _logo;
  Object? _certificate;

  Company(
    this._id,
    this._email,
    this._password,
    this._name,
    this._address,
    this._certificate,
    this._logo,
  );

  factory Company.from(Map<String, Object?> source) => Company(
        source['_id'] as String?,
        source['email'] as String,
        source['password'] as String,
        source['name'] as String,
        source['address'] as String,
        source['certificate'],
        source['logo'],
      );

  HTTP http = HTTP();
  final String baseUrl = '/companies';

  static get(String id) async =>
      await HTTP().get(Uri.parse('/companies/${json.encode({'_id': id})}'));

  static getAny(Map<String, Object?> filter) async =>
      await HTTP().get(Uri.parse('/companies/${json.encode(filter)}'));

  static signUp(Map<String, Object?> source) async =>
      await HTTP().post(Uri.parse('/companies/register'), source);

  static signIn(Map<String, Object?> source) async =>
      await HTTP().post(Uri.parse('/companies'), source);

  session() async => _from(await http.get(Uri.parse(baseUrl)));

  logOut() async => await http.delete(Uri.parse(baseUrl));

  update() async => http.patch(Uri.parse('$baseUrl/register'), _to());

  delete() async => await http.delete(Uri.parse('$baseUrl/register'));

  _from(Map<String, Object?> source) {
    _password = source['password'] as String;
    _name = source['name'] as String;
    _email = source['email'] as String;
    _id = source['id'] as String;
    _logo = source['logo'];
    _certificate = source['certificate'];
    _address = source['address'] as String;
  }

  Map<String, Object?> _to() {
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
