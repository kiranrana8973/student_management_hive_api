import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/features/home/presentation/state/home_state.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(),
);

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel() : super(HomeState.initialState());

  void changeIndex(int index) {
    state = state.copyWith(index: index);
  }
}
