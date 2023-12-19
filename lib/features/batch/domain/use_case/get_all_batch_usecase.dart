import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_hive_api/features/batch/domain/repository/batch_repository.dart';

final getAllBatchUsecaseProvider = Provider.autoDispose<GetAllBatchUsecase>(
  (ref) => GetAllBatchUsecase(repository: ref.read(batchRepositoryProvider)),
);

class GetAllBatchUsecase {
  final IBatchRepository repository;

  GetAllBatchUsecase({required this.repository});

  Future<Either<Failure, List<BatchEntity>>> getAllBatch() async {
    return await repository.getAllBatches();
  }
}
