import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';

class BatchState {
  final bool isLoading;
  final List<BatchEntity> batches;

  BatchState({
    required this.isLoading,
    required this.batches,
  });

  factory BatchState.initialState() => BatchState(
        isLoading: false,
        batches: [],
      );

  BatchState copyWith({
    bool? isLoading,
    List<BatchEntity>? batches,
  }) {
    return BatchState(
      isLoading: isLoading ?? this.isLoading,
      batches: batches ?? this.batches,
    );
  }
}
