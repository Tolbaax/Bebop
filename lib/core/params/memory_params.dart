import 'dart:io';

import 'package:equatable/equatable.dart';

class MemoryParams extends Equatable {
  final File? imageFile;
  final String title;
  final String desc;

  const MemoryParams({
    required this.imageFile,
    required this.title,
    required this.desc,
  });

  @override
  List<Object?> get props => [imageFile, title, desc];
}
