import 'package:equatable/equatable.dart';

class StackedLineChartEntity extends Equatable {
  final String day;
  final double? height;
  final double? weight;

  StackedLineChartEntity({
    required this.day,
    this.height,
    this.weight,
  });

  @override
  List<Object?> get props => [day, height, weight];
}
