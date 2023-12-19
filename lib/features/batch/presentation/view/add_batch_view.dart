import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_hive_api/features/batch/presentation/view_model/batch_view_model.dart';

class AddBatchView extends ConsumerWidget {
  AddBatchView({super.key});

  final gap = const SizedBox(height: 8);
  final batchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            gap,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Add Batch',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            TextFormField(
              controller: batchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Batch Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter batch';
                }
                return null;
              },
            ),
            gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  BatchEntity batch =
                      BatchEntity(batchName: batchController.text);
                  ref.read(batchViewModelProvider.notifier).addBatch(batch);
                },
                child: const Text('Add Batch'),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'List of Batches',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            Expanded(
              child: ref.watch(batchViewModelProvider).batches.isEmpty
                  ? const Center(
                      child: Text('No Batches'),
                    )
                  : ListView.builder(
                      itemCount:
                          ref.watch(batchViewModelProvider).batches.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(ref
                              .watch(batchViewModelProvider)
                              .batches[index]
                              .batchName),
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
