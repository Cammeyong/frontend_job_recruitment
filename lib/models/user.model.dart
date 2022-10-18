import 'package:frontend_job_recruitment/services/http.service.dart';

class User {
  final String? name;
  final String email;
  final String password;
  List<String> postHistory = [];

  User(this.name, this.email, this.password);

  HTTP http = HTTP();
  final String baseUrl = '/users';

  signUp() async {
    return await http.post(
      Uri.parse('$baseUrl/register'),
      {'name': name, 'email': email, 'password': password},
    );
  }

  signIn() async {
    Map<String, dynamic> user = await http.post(
      Uri.parse(baseUrl),
      {'email': email, 'password': password},
    );
    postHistory = user['postHistory'];
    return user;
  }

  session() async {
    Map<String, dynamic> user = await http.get(Uri.parse(baseUrl));
    postHistory = user['postHistory'];
    return user;
  }

  logOut() async {
    return await http.delete(Uri.parse(baseUrl));
  }

  delete() async {
    return await http.delete(Uri.parse('$baseUrl/register'));
  }

  update() async {
    // TODO
  }
}
