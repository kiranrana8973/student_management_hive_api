import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_hive_api/features/batch/domain/use_case/add_batch_usecase.dart';
import 'package:student_management_hive_api/features/batch/domain/use_case/get_all_batch_usecase.dart';
import 'package:student_management_hive_api/features/batch/presentation/state/batch_state.dart';

final batchViewModelProvider =
    StateNotifierProvider.autoDispose<BatchViewModel, BatchState>(
  (ref) => BatchViewModel(
    addBatchUsecase: ref.read(addBatchUsecaseProvider),
    getAllBatchUsecase: ref.read(getAllBatchUsecaseProvider),
  ),
);

class BatchViewModel extends StateNotifier<BatchState> {
  final AddBatchUsecase addBatchUsecase;
  final GetAllBatchUsecase getAllBatchUsecase;

  BatchViewModel({
    required this.addBatchUsecase,
    required this.getAllBatchUsecase,
  }) : super(BatchState.initialState()) {
    getAllBatch();
  }

  void addBatch(BatchEntity batch) {
    state = state.copyWith(isLoading: true);
    addBatchUsecase.addBatch(batch).then((value) {
      value.fold(
        (failure) => state = state.copyWith(isLoading: false),
        (success) {
          state = state.copyWith(isLoading: false, showMessage: true);
          getAllBatch();
        },
      );
    });
  }

  void getAllBatch() {
    state = state.copyWith(isLoading: true);
    getAllBatchUsecase.getAllBatch().then((value) {
      value.fold(
        (failure) => state = state.copyWith(isLoading: false),
        (batches) {
          state = state.copyWith(isLoading: false, batches: batches);
        },
      );
    });
  }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }
}
