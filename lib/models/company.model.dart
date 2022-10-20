import 'dart:convert';
import 'dart:io';

import 'package:frontend_job_recruitment/models/post.model.dart';
import 'package:frontend_job_recruitment/services/http.service.dart';

class Company {
  String? _id;
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

  factory Company.from(Map<String, dynamic> source) => Company(
        source['_id'],
        source['email'],
        source['password'],
        source['name'],
        source['address'],
        source['certificate'],
        source['logo'],
      );

  HTTP http = HTTP();
  final String baseUrl = '/companies';

  static get(String id) async {
    return await HTTP()
        .get(Uri.parse('/companies/${json.encode({'_id': id})}'));
  }

  static getAny(Map<String, dynamic> filter) async {
    return await HTTP().get(Uri.parse('/companies/${json.encode(filter)}'));
  }

  static signUp(Map<String, dynamic> source) async {
    return await HTTP().post(Uri.parse('/companies/register'), source);
  }

  static signIn(Map<String, dynamic> source) async {
    return await HTTP().post(Uri.parse('/companies'), source);
  }

  session() async {
    _from(await http.get(Uri.parse(baseUrl)));
  }

  logOut() async {
    await http.delete(Uri.parse(baseUrl));
  }

  update() async {
    await http.patch(Uri.parse('$baseUrl/register'), _to());
  }

  delete() async {
    return await http.delete(Uri.parse('$baseUrl/register'));
  }

  _from(Map<String, dynamic> source) {
    // TODO source => properties
  }

  Map<String, dynamic> _to() {
    return {};
  }
}
