import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/master.model.dart';

class MasterNotifier extends StateNotifier<Master> {
  MasterNotifier(super.state);
}

StateNotifierProvider<MasterNotifier, Master> masterProvider =
    StateNotifierProvider<MasterNotifier, Master>(
  (ref) => MasterNotifier(Master()),
);
