import 'package:frontend_job_recruitment/models/company.model.dart';
import 'package:frontend_job_recruitment/models/post.model.dart';
import 'package:frontend_job_recruitment/models/user.model.dart';

class Master {
  User? userModel;
  Company? companyModel;
  Post? postModel;
  List<Company> companyCatalogue = [];
  List<Post> postCatalogue = [];
}