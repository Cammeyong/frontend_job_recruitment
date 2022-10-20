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

  factory User.from(Map<String, dynamic> source) {
    return User(
        source['_id'], source['name'], source['email'], source['password']);
  }

  HTTP http = HTTP();
  final String baseUrl = '/users';

  static signUp(Map<String, dynamic> source) async {
    return await HTTP().post(Uri.parse('/users/register'), source);
  }

  static signIn(Map<String, dynamic> source) async {
    return await HTTP().post(Uri.parse('/users'), source);
  }

  session() async {
    _from(await http.get(Uri.parse(baseUrl)));
  }

  logOut() async {
    await http.delete(Uri.parse(baseUrl));
  }

  delete() async {
    return await http.delete(Uri.parse('$baseUrl/register'));
  }

  update() async {
    await http.patch(Uri.parse('$baseUrl/register'), _to());
  }

  _from(Map<String, dynamic> source) {
    _postHistory = source['post_history'];
    _name = source['name'];
    _email = source['email'];
    _password = source['password'];
  }

  Map<String, dynamic> _to() {
    return {
      'email': _email,
      'name': _name,
      'password': _password,
      'post_history': _postHistory,
    };
  }
}
