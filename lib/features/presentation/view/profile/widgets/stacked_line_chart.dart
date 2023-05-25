import 'package:bebop/features/domain/entities/stacked_line_chart_entity.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_strings.dart';

class StackedLineChart extends StatelessWidget {
  StackedLineChart({Key? key}) : super(key: key);

  final List<StackedLineChartEntity> heightData = [
    StackedLineChartEntity(day: '1', height: 40),
    StackedLineChartEntity(day: '5', height: 42.5),
    StackedLineChartEntity(day: '10', height: 42),
    StackedLineChartEntity(day: '15', height: 50),
    StackedLineChartEntity(day: '20', height: 50),
    StackedLineChartEntity(day: '25', height: 50.1),
    StackedLineChartEntity(day: '30', height: 51),
  ];

  final List<StackedLineChartEntity> weightData = [
    StackedLineChartEntity(day: '1', weight: 15),
    StackedLineChartEntity(day: '5', weight: 20),
    StackedLineChartEntity(day: '10', weight: 20),
    StackedLineChartEntity(day: '15', weight: 35),
    StackedLineChartEntity(day: '20', weight: 32),
    StackedLineChartEntity(day: '25', weight: 32),
    StackedLineChartEntity(day: '30', weight: 35),
    StackedLineChartEntity(day: '30', weight: 25),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SfCartesianChart(
        title: ChartTitle(text: AppStrings.lastMonth),
        legend: Legend(isVisible: true, position: LegendPosition.bottom),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(
          axisLine: AxisLine(width: 0),
          majorGridLines: MajorGridLines(width: 0.5),
        ),
        series: <LineSeries<StackedLineChartEntity, String>>[
          LineSeries<StackedLineChartEntity, String>(
            enableTooltip: true,
            color: AppColors.primary.withOpacity(0.8),
            emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.gap),
            dataSource: heightData,
            xValueMapper: (data, _) => data.day,
            yValueMapper: (data, _) => data.height!,
            name: AppStrings.height,
            markerSettings: const MarkerSettings(isVisible: true),
          ),
          LineSeries<StackedLineChartEntity, String>(
            enableTooltip: true,
            emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.gap),
            dataSource: weightData,
            xValueMapper: (data, _) => data.day,
            yValueMapper: (data, _) => data.weight!,
            name: AppStrings.weight,
            markerSettings: const MarkerSettings(isVisible: true),
          ),
        ],
        tooltipBehavior: TooltipBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          canShowMarker: true,
        ),
      ),
    );
  }
}
