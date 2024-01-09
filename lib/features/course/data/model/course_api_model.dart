import 'package:json_annotation/json_annotation.dart';
import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';

part 'course_api_model.g.dart';

@JsonSerializable()
class CourseAPIModel {
  @JsonKey(name: '_id')
  final String? courseId;
  final String courseName;

  CourseAPIModel({this.courseId, required this.courseName});

  factory CourseAPIModel.fromJson(Map<String, dynamic> json) =>
      _$CourseAPIModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseAPIModelToJson(this);

  // From entity to model
  factory CourseAPIModel.fromEntity(CourseEntity entity) {
    return CourseAPIModel(
      courseId: entity.courseId,
      courseName: entity.courseName,
    );
  }

  // From model to entity
  static CourseEntity toEntity(CourseAPIModel model) {
    return CourseEntity(
      courseId: model.courseId,
      courseName: model.courseName,
    );
  }
}
