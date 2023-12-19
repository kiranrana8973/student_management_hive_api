import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';
import 'package:student_management_hive_api/features/course/domain/repository/course_repository.dart';

final getAllUsecaseProvider = Provider<GetAllCourseUsecase>(
  (ref) =>
      GetAllCourseUsecase(courseRepository: ref.read(courseRepositoryProvider)),
);

class GetAllCourseUsecase {
  final ICourseRepository courseRepository;

  GetAllCourseUsecase({required this.courseRepository});

  Future<Either<Failure, List<CourseEntity>>> call() async {
    return await courseRepository.getAllCourses();
  }
}
