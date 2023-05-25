import 'package:equatable/equatable.dart';

class MemoryEntity extends Equatable {
  final String memoryId;
  final String memoryImageUrl;
  final String title;
  final String desc;
  final String publishTime;

  const MemoryEntity({
    required this.memoryId,
    required this.memoryImageUrl,
    required this.title,
    required this.desc,
    required this.publishTime,
  });

  @override
  List<Object> get props =>
      [memoryId, memoryImageUrl, title, desc, publishTime];
}
