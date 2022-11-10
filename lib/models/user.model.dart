import 'package:frontend_job_recruitment/services/http.service.dart';

HTTP _http = HTTP();
const String _baseUrl = '/users';

class User {
  String _id;
  String _name;
  String _email;
  String _password;
  List<dynamic> _postHistory = [];

  User(this._id, this._name, this._email, this._password);

  factory User.fromJson(Map<String, Object?> source) {
    return User(
      source['_id'] as String,
      source['name'] as String,
      source['email'] as String,
      source['password'] as String,
    );
  }

  static Future<Map<String, dynamic>?> signUp(Map<String, Object> source) async =>
      await _http.post(Uri.parse(_baseUrl), source);

  static Future<User?> signIn(Map<String, Object> source) async => User.fromJson(
      (await _http.post(Uri.parse('$_baseUrl/login'), source))!['data'] as Map<String, dynamic>);

  static Future<User?> session() async =>
      User.fromJson((await _http.get(Uri.parse(_baseUrl)))!['data'] as Map<String, dynamic>);

  Future<Map<String, dynamic>?> logOut() async => await _http.delete(Uri.parse('/logout'));

  Future<Map<String, dynamic>?> delete() async => await _http.delete(Uri.parse(_baseUrl));

  Future<Map<String, dynamic>?> update() async => await _http.patch(Uri.parse(_baseUrl), toJson());

  from(Map<String, Object?> source) {
    _id = source['_id'] as String? ?? _id;
    _postHistory = source['post_history'] as List<dynamic>? ?? _postHistory;
    _name = source['name'] as String? ?? _name;
    _email = source['email'] as String? ?? _email;
    _password = source['password'] as String? ?? _password;
  }

  Map<String, Object?> toJson() {
    return {
      '_id': _id,
      'email': _email,
      'name': _name,
      'password': _password,
      'post_history': _postHistory,
    };
  }
}
