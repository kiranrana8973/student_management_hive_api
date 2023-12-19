import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management_hive_api/config/constants/hive_table_constant.dart';
import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

part 'batch_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel {
  @HiveField(0)
  final String batchId;

  @HiveField(1)
  final String batchName;

  // empty constructor
  BatchHiveModel.empty() : this(batchId: '', batchName: '');

  BatchHiveModel({
    String? batchId,
    required this.batchName,
  }) : batchId = batchId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  BatchEntity toEntity() => BatchEntity(
        batchId: batchId,
        batchName: batchName,
      );

  // Convert Entity to Hive Object
  BatchHiveModel toHiveModel(BatchEntity entity) => BatchHiveModel(
        // batchId: entity.batchId,
        batchName: entity.batchName,
      );

  @override
  String toString() {
    return 'batchId: $batchId, batchName: $batchName';
  }
}
