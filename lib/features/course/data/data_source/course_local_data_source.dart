import 'package:dartz/dartz.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';

class CourseLocalDataSource {
  // Add Course
  Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
    return const Right(true);
  }

  // Get All Courses
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    return const Right([]);
  }
}
