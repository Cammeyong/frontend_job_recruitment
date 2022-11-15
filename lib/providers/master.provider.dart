import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_job_recruitment/models/company.model.dart';
import '../models/master.model.dart';
import '../models/post.model.dart';
import '../models/user.model.dart';

class MasterNotifier extends StateNotifier<Master> {
  MasterNotifier(super.state);

  setUser(User user) {
    state.userModel = user;
  }
  setCompany(Company company) {
    state.companyModel = company;
  }
  setPost(Post post) {
    state.postModel = post;
  }
  setPostCatalogue(List<Post> postList) {
    state.postCatalogue = postList;
  }
}

StateNotifierProvider<MasterNotifier, Master> masterProvider =
    StateNotifierProvider<MasterNotifier, Master>(
  (ref) => MasterNotifier(Master()),
);
