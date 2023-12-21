import 'package:flutter/widgets.dart';
import 'package:student_management_hive_api/features/batch/presentation/view/add_batch_view.dart';
import 'package:student_management_hive_api/features/course/presentation/view/add_course_view.dart';
import 'package:student_management_hive_api/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:student_management_hive_api/features/home/presentation/view/bottom_view/profile_view.dart';

class HomeState {
  final int index;
  final List<Widget> lstWidgets;

  HomeState({required this.index, required this.lstWidgets});

  HomeState.initialState()
      : index = 0,
        lstWidgets = [
          const DashboardView(),
          AddCourseView(),
          AddBatchView(),
          const ProfileView(),
        ];
  // CopyWith function to change the index no
  HomeState copyWith({
    int? index,
  }) {
    return HomeState(
      index: index ?? this.index,
      lstWidgets: lstWidgets,
    );
  }
}
