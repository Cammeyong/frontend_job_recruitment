import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_job_recruitment/screens/landing.screen.dart';

LandingPages landingPages = LandingPages.landing;

class LandingPagesNotifier extends StateNotifier<LandingPages> {
  LandingPagesNotifier(super.state);

  setPage(LandingPages page) {
    state = page;
  }
}

StateNotifierProvider<LandingPagesNotifier, LandingPages> landingPagesProvider =
    StateNotifierProvider(
  (ref) => LandingPagesNotifier(landingPages),
);
