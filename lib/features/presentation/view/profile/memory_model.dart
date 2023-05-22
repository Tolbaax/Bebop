

import '../../../../core/utils/assets_manager.dart';

class MemoryModel {
  final String image;
  final String title;
  final String time;
  final String date;
  final String desc;

  MemoryModel({
    required this.image,
    required this.title,
    required this.time,
    required this.date,
    required this.desc,
  });
}

List<MemoryModel> albums = [
  MemoryModel(
    image: ImageAssets.baby8,
    title: 'Build Memories',
    time: '10:30pm',
    date: '13/2/2001',
    desc: 'First Step for my lovely child',
  ),
  MemoryModel(
    image: ImageAssets.baby6,
    title: 'First Step',
    time: '10:30pm',
    date: '13/2/2001',
    desc: 'First Step for my lovely child',
  ),
];
