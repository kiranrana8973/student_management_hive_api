import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddBatchView extends ConsumerStatefulWidget {
  const AddBatchView({super.key});

  @override
  ConsumerState<AddBatchView> createState() => _AddBatchViewState();
}

class _AddBatchViewState extends ConsumerState<AddBatchView> {
  final gap = const SizedBox(height: 8);
  final batchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
