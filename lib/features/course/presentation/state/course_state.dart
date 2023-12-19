import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';

class CourseState {
  final bool isLoading;
  final List<CourseEntity> courses;

  CourseState({
    required this.isLoading,
    required this.courses,
  });

  factory CourseState.initialState() {
    return CourseState(
      isLoading: false,
      courses: [],
    );
  }

  CourseState copyWith({
    bool? isLoading,
    List<CourseEntity>? courses,
  }) {
    return CourseState(
      isLoading: isLoading ?? this.isLoading,
      courses: courses ?? this.courses,
    );
  }
}
