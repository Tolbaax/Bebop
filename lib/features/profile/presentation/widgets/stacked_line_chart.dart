import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';

class StackedLineChart extends StatefulWidget {
  const StackedLineChart({super.key});

  @override
  State<StackedLineChart> createState() => _StackedLineChartState();
}

class _StackedLineChartState extends State<StackedLineChart> {
  List<_ChartData>? heightData;
  List<_ChartData>? weightData;

  @override
  void initState() {
    heightData = <_ChartData>[
      _ChartData(day: '1', height: 40),
      _ChartData(day: '5', height: 42),
      _ChartData(day: '10', height: 42),
      _ChartData(day: '15', height: 50),
      _ChartData(day: '20', height: 55),
      _ChartData(day: '25', height: 70),
      _ChartData(day: '30', height: 70),
    ];

    weightData = <_ChartData>[
      _ChartData(day: '1', weight: 15),
      _ChartData(day: '5', weight: 20),
      _ChartData(day: '10', weight: 20),
      _ChartData(day: '15', weight: 35),
      _ChartData(day: '20', weight: 32),
      _ChartData(day: '25', weight: 32),
      _ChartData(day: '30', weight: 35),
      _ChartData(day: '30', weight: 25),
    ];
    super.initState();
  }

  @override
  void dispose() {
    heightData!.clear();
    weightData!.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SfCartesianChart(
        title: ChartTitle(text: AppStrings.lastMonth),
        primaryXAxis: CategoryAxis(),
        series: <LineSeries<_ChartData, String>>[
          LineSeries<_ChartData, String>(
            enableTooltip: true,
            color: AppColors.primary.withOpacity(0.8),
            emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.gap),
            dataSource: heightData!,
            xValueMapper: (_ChartData sales, _) => sales.day,
            yValueMapper: (_ChartData sales, _) => sales.height,
            name: AppStrings.height,
            markerSettings: const MarkerSettings(isVisible: true),
          ),
          LineSeries<_ChartData, String>(
            enableTooltip: true,
            emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.gap),
            dataSource: weightData!,
            xValueMapper: (_ChartData sales, _) => sales.day,
            yValueMapper: (_ChartData sales, _) => sales.weight,
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

class _ChartData {
  final String? day;
  final int? height;
  final int? weight;

  _ChartData({required this.day, this.height, this.weight});
}
