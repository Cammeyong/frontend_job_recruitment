import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/user.screen.dart';

UserPages landingPages = UserPages.profile;

class UserPagesNotifier extends StateNotifier<UserPages> {
  UserPagesNotifier(super.state);

  setPage(UserPages page) {
    state = page;
  }
}

StateNotifierProvider<UserPagesNotifier, UserPages> userPagesProvider =
StateNotifierProvider(
      (ref) => UserPagesNotifier(landingPages),
);
