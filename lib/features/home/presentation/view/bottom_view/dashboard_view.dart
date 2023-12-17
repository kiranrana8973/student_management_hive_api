import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/common/snackbar/my_snackbar.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard View'),
          actions: [
            IconButton(
              onPressed: () {
                showSnackBar(message: 'Refressing...', context: context);
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            Switch(value: true, onChanged: (value) {}),
          ],
        ),
        body: const Center(child: Text('Dashboard')));
  }
}
