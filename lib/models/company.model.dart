import 'package:dio/dio.dart';
import 'package:frontend_job_recruitment/services/http.service.dart';

HTTP _http = HTTP();
const String _baseUrl = '/companies';

class Company {
  String _id;
  String _name;
  String _email;
  String _password;
  String _address;
  String _logo;
  String _certificate;

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
        source['certificate'] as String,
        source['logo'] as String,
      );

  static get(String id) async => await HTTP().get(Uri.parse('/companies/$id'));

  static Future<Map<String, dynamic>?> signUp(Map<String, Object> source) async {
    source['logo'] = await MultipartFile.fromFile(source['logo'] as String);
    source['certificate'] = await MultipartFile.fromFile(source['certificate'] as String);
    return await _http.postFD(Uri.parse(_baseUrl), FormData.fromMap(source));
  }

  static Future<Company?> signIn(Map<String, Object> source) async => Company.fromJson(
      (await _http.post(Uri.parse('$_baseUrl/login'), source))!['data'] as Map<String, dynamic>);

  static Future<Company?> session() async =>
      Company.fromJson((await _http.get(Uri.parse(_baseUrl)))!['data'] as Map<String, dynamic>);

  Future<Map<String, dynamic>?> logOut() async => await _http.delete(Uri.parse('/logout'));

  Future<Map<String, dynamic>?> delete() async => await _http.delete(Uri.parse(_baseUrl));

  Future<Map<String, dynamic>?> update() async {
    var source = toJson();
    source['logo'] = await MultipartFile.fromFile(source['logo'] as String);
    source['certificate'] = await MultipartFile.fromFile(source['certificate'] as String);
    return await _http.patchFD(Uri.parse(_baseUrl), FormData.fromMap(source));
  }

  from(Map<String, Object?> source) {
    _password = source['password'] as String;
    _name = source['name'] as String;
    _email = source['email'] as String;
    _id = source['id'] as String;
    _logo = source['logo'] as String;
    _certificate = source['certificate'] as String;
    _address = source['address'] as String;
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
