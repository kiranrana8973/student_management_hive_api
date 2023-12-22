import 'package:equatable/equatable.dart';
import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';

class AuthEntity extends Equatable {
  final String? studentId;
  final String fname;
  final String lname;
  final String? image;
  final String phone;
  final BatchEntity batch;
  final List<CourseEntity> courses;
  final String username;
  final String password;

  const AuthEntity({
    this.studentId,
    required this.fname,
    required this.lname,
    this.image,
    required this.phone,
    required this.batch,
    required this.courses,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [studentId, fname, lname, image, phone, batch, courses, username, password];
}
