import 'package:json_annotation/json_annotation.dart';
import 'package:student_management_hive_api/features/auth/domain/entity/auth_entity.dart';
import 'package:student_management_hive_api/features/batch/data/model/batch_api_model.dart';
import 'package:student_management_hive_api/features/course/data/model/course_api_model.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? studentId;
  final String fname;
  final String lname;
  final String? image;
  final String phone;
  final BatchAPIModel batch;
  final List<CourseAPIModel> course;
  final String username;
  final String? password;

  AuthApiModel({
    this.studentId,
    required this.fname,
    required this.lname,
    this.image,
    required this.phone,
    required this.batch,
    required this.course,
    required this.username,
    this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To entity
  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
      studentId: apiModel.studentId,
      fname: apiModel.fname,
      lname: apiModel.lname,
      image: apiModel.image,
      phone: apiModel.phone,
      batch: apiModel.batch,
      course: apiModel.course,
      username: apiModel.username,
      password: apiModel.password,
    );
  }

  // From entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      studentId: entity.studentId,
      fname: entity.fname,
      lname: entity.lname,
      image: entity.image,
      phone: entity.phone,
      batch: BatchAPIModel.fromEntity(entity.batch),
      course: entity.courses.map((e) => CourseAPIModel.fromEntity(e)).toList(),
      username: entity.username,
      password: entity.password,
    );
  }
}
  