import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';
import 'package:student_management_hive_api/features/course/presentation/view_model/course_view_model.dart';

class AddCourseView extends ConsumerWidget {
  AddCourseView({super.key});

  final courseController = TextEditingController();
  final gap = const SizedBox(height: 8);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseState = ref.watch(courseViewModelProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            gap,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Add Course',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            TextFormField(
              controller: courseController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Course Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter course name';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  CourseEntity courseEntity = CourseEntity(
                    courseName: courseController.text,
                  );
                  ref
                      .read(courseViewModelProvider.notifier)
                      .addCourse(courseEntity);
                },
                child: const Text('Add Course'),
              ),
            ),
            gap,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'List of Courses',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            courseState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: courseState.courses.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(courseState.courses[index].courseName),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
