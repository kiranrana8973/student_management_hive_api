import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management_hive_api/config/constants/hive_table_constant.dart';
import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';
import 'package:uuid/uuid.dart';

part 'course_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel {
  @HiveField(0)
  final String courseId;

  @HiveField(1)
  final String courseName;

  // empty constructor
  CourseHiveModel.empty() : this(courseId: '', courseName: '');

  CourseHiveModel({
    String? courseId,
    required this.courseName,
  }) : courseId = courseId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName,
      );

  // Convert Entity to Hive Object
  CourseHiveModel toHiveModel(CourseEntity entity) => CourseHiveModel(
        // courseId: entity.courseId,
        courseName: entity.courseName,
      );

  @override
  String toString() {
    return 'courseId: $courseId, courseName: $courseName';
  }
}
