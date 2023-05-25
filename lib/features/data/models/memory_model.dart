import 'package:bebop/features/domain/entities/memory_entity.dart';

class MemoryModel extends MemoryEntity {
  MemoryModel({
    required super.memoryId,
    required super.memoryImageUrl,
    required super.title,
    required super.desc,
    required super.publishTime,
  });

  factory MemoryModel.fromJson(Map<String, dynamic> json) => MemoryModel(
        memoryId: json['memoryId'] ?? '',
        memoryImageUrl: json['memoryImageUrl'] ?? '',
        title: json['title'] ?? '',
        desc: json['desc'] ?? '',
        publishTime: json['publishTime'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'memoryId': memoryId,
        'memoryImageUrl': memoryImageUrl,
        'title': title,
        'desc': desc,
        'publishTime': publishTime,
      };
}
