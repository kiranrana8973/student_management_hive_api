import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';
import 'package:student_management_hive_api/features/course/domain/repository/course_repository.dart';

final addCourseUsecaseProvider = Provider.autoDispose<AddCourseUsecase>(
  (ref) =>
      AddCourseUsecase(courseRepository: ref.read(courseRepositoryProvider)),
);

class AddCourseUsecase {
  final ICourseRepository courseRepository;

  AddCourseUsecase({required this.courseRepository});

  Future<Either<Failure, bool>> call(CourseEntity courseEntity) async {
    return await courseRepository.addCourse(courseEntity);
  }
}
