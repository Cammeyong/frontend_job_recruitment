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

  signUp() async {
    return await http.post(
      Uri.parse('$baseUrl/register'),
      {'name': _name, 'email': _email, 'password': _password},
    );
  }

  signIn() async {
    Map<String, dynamic> user = await http.post(
      Uri.parse(baseUrl),
      {'email': _email, 'password': _password},
    );
    _postHistory = user['postHistory'];
    return user;
  }

  session() async {
    Map<String, dynamic> user = await http.get(Uri.parse(baseUrl));
    _postHistory = user['postHistory'];
    return user;
  }

  logOut() async {
    return await http.delete(Uri.parse(baseUrl));
  }

  delete() async {
    return await http.delete(Uri.parse('$baseUrl/register'));
  }

  update() async {
    Map<String, dynamic> user = await http.post(
      Uri.parse('$baseUrl/register'),
      {'name': _name, 'email': _email, 'password': _password},
    );
    _from(user);
    return user;
  }

  _from(Map<String, dynamic> source) {
    _postHistory = source['postHistory'];
    _name = source['name'];
    _email = source['email'];
    _password = source['password'];
  }
}
