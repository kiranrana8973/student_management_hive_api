import 'package:dartz/dartz.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';

class BatchLocalDataSource {
  // Add Batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) async {
    return const Right(true);
  }

  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    return const Right([]);
  }
}
