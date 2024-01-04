// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseAPIModel _$CourseAPIModelFromJson(Map<String, dynamic> json) =>
    CourseAPIModel(
      courseId: json['_id'] as String?,
      courseName: json['courseName'] as String,
    );

Map<String, dynamic> _$CourseAPIModelToJson(CourseAPIModel instance) =>
    <String, dynamic>{
      '_id': instance.courseId,
      'courseName': instance.courseName,
    };
