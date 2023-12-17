import 'package:dartz/dartz.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/core/network/hive_service.dart';
import 'package:student_management_hive_api/features/auth/domain/entity/auth_entity.dart';

class AuthLocalDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  Future<Either<Failure, bool>> registerStudent(AuthEntity student) async {
    // TODO: implement registerStudent
    return const Right(true);
  }

  Future<Either<Failure, bool>> loginStudent(
    String username,
    String password,
  ) async {
    return const Right(true);
  }
}


