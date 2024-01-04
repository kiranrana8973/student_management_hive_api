import 'package:json_annotation/json_annotation.dart';
import 'package:student_management_hive_api/features/course/data/model/course_api_model.dart';

part 'get_all_course_dto.g.dart';

@JsonSerializable()
class GetAllCourseDTO {
  final bool success;
  final int count;
  final List<CourseAPIModel> data;

  GetAllCourseDTO(
      {required this.success, required this.count, required this.data});

  factory GetAllCourseDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllCourseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCourseDTOToJson(this);

  static GetAllCourseDTO toEntity(GetAllCourseDTO getAllCourseDTO) {
    return GetAllCourseDTO(
      success: getAllCourseDTO.success,
      count: getAllCourseDTO.count,
      data: getAllCourseDTO.data,
    );
  }

  static GetAllCourseDTO fromEntity(GetAllCourseDTO getAllCourseDTO) {
    return GetAllCourseDTO(
      success: getAllCourseDTO.success,
      count: getAllCourseDTO.count,
      data: getAllCourseDTO.data,
    );
  }
}
