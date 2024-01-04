import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management_hive_api/config/constants/hive_table_constant.dart';
import 'package:student_management_hive_api/features/auth/domain/entity/auth_entity.dart';
import 'package:student_management_hive_api/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management_hive_api/features/course/data/model/course_hive_model.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.studentTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String studentId;

  @HiveField(1)
  final String fname;

  @HiveField(2)
  final String lname;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final BatchHiveModel batch;

  @HiveField(5)
  final List<CourseHiveModel> courses;

  @HiveField(6)
  final String username;

  @HiveField(7)
  final String password;

  // Constructor
  AuthHiveModel({
    String? studentId,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.batch,
    required this.courses,
    required this.username,
    required this.password,
  }) : studentId = studentId ?? const Uuid().v4();

  // // empty constructor
  AuthHiveModel.empty()
      : this(
          studentId: '',
          fname: '',
          lname: '',
          phone: '',
          batch: BatchHiveModel.empty(),
          courses: [],
          username: '',
          password: '',
        );

  // Convert Entity to Hive Object
  factory AuthHiveModel.toHiveModel(AuthEntity entity) => AuthHiveModel(
        fname: entity.fname,
        lname: entity.lname,
        phone: entity.phone,
        batch: BatchHiveModel.toHiveModel(entity.batch),
        courses:
            entity.courses.map((e) => CourseHiveModel.toHiveModel(e)).toList(),
        username: entity.username,
        password: entity.password,
      );

  // Convert Hive Object to Entity
  static AuthEntity toEntity(AuthHiveModel hiveModel) => AuthEntity(
        studentId: hiveModel.studentId,
        fname: hiveModel.fname,
        lname: hiveModel.lname,
        phone: hiveModel.phone,
        batch: BatchHiveModel.toEntity(hiveModel.batch),
        courses:
            hiveModel.courses.map((e) => CourseHiveModel.toEntity(e)).toList(),
        username: hiveModel.username,
        password: hiveModel.password,
      );

  @override
  String toString() {
    return 'studentId: $studentId, fname: $fname, lname: $lname, phone: $phone, batch: $batch, courses: $courses, username: $username, password: $password';
  }

  @override
  List<Object?> get props => [
        studentId,
        fname,
        lname,
        phone,
        batch,
        courses,
        username,
        password,
      ];
}
