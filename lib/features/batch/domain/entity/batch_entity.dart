import 'package:equatable/equatable.dart';

class BatchEntity extends Equatable {
  final String? batchId;
  final String batchName;

  @override
  List<Object?> get props => [batchId, batchName];

  const BatchEntity({
    this.batchId,
    required this.batchName,
  });

  @override
  String toString() {
    return 'BatchEntity(batchId: $batchId, batchName: $batchName)';
  }
}
