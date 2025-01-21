import 'package:hive/hive.dart';

part 'detection_model.g.dart';

@HiveType(typeId: 0)
class DetectionModel extends HiveObject {
  @HiveField(0)
  final String imagePath;

  @HiveField(1)
  final String label;

  @HiveField(2)
  final double accuracy;

  @HiveField(3)
  final DateTime timestamp;

  DetectionModel({
    required this.imagePath,
    required this.label,
    required this.accuracy,
    required this.timestamp,
  });
}