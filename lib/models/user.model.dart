import 'package:frontend_job_recruitment/services/http.service.dart';

class User {
  String? _id;
  String? _name;

  String? get name {
    return _name;
  }

  String _email;

  String? get email {
    return _email;
  }

  String _password;
  List<String> _postHistory = [];

  List<String> get postHistory {
    return _postHistory;
  }

  User(this._id, this._name, this._email, this._password);

  factory User.fromJson(Map<String, Object?> source) {
    return User(
      source['_id'] as String?,
      source['name'] as String,
      source['email'] as String,
      source['password'] as String,
    );
  }

  HTTP http = HTTP();
  final String baseUrl = '/users';

  static Future<Map<String, Object?>> signUp(Map<String, Object?> source) async {
    return await HTTP().post(Uri.parse('/users/register'), source);
  }

  static Future<Map<String, Object?>> signIn(Map<String, Object?> source) async {
    return HTTP().post(Uri.parse('/users/login'), source);
  }

  session() async {
    _from(await http.get(Uri.parse(baseUrl)));
  }

  logOut() async {
    await http.delete(Uri.parse(baseUrl));
  }

  Future<Map<String, Object?>> delete() async {
    return await http.delete(Uri.parse('$baseUrl/register'));
  }

  update() async {
    await http.patch(Uri.parse('$baseUrl/register'), toJson());
  }

  _from(Map<String, Object?> source) {
    _postHistory = source['post_history'] as List<String>;
    _name = source['name'] as String;
    _email = source['email'] as String;
    _password = source['password'] as String;
  }

  Map<String, Object?> toJson() {
    return {
      'email': _email,
      'name': _name,
      'password': _password,
      'post_history': _postHistory,
    };
  }
}
