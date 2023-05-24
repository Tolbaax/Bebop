import 'package:equatable/equatable.dart';

class StackedLineChartModel extends Equatable {
  final String day;
  final double? height;
  final double? weight;

  StackedLineChartModel({
    required this.day,
    this.height,
    this.weight,
  });

  @override
  List<Object?> get props => [day, height, weight];
}
