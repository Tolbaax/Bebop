import 'dart:ui' as ui;

import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/constants.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../components/buttons/appbar_back_button.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({Key? key}) : super(key: key);

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  TooltipBehavior? tooltipBehavior;

  @override
  void initState() {
    tooltipBehavior = TooltipBehavior(enable: true, canShowMarker: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBackButton(),
        title: Text(Constants().todayDate),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 5.0.sp),
        child: Column(
          children: [
            SizedBox(
              height: 1.0.h,
            ),
            Container(
              width: context.width * 0.48,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12.0.sp),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Baby Temp',
                        style: TextStyle(
                          fontSize: 15.0.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      '37.0°C',
                      style: TextStyle(
                        fontSize: 25.0.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.0.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 8.0.sp),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.temperature,
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryYAxis: NumericAxis(
                labelFormat: '{value}°C',
                minimum: 32,
                maximum: 40,
                interval: 1,
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(color: Colors.transparent),
              ),
              tooltipBehavior: tooltipBehavior,
              series: _getGradientComparisonSeries(),
            ),
            SizedBox(height: 2.0.h,),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 8.0.sp),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'About Your Baby Temp',
                  style: TextStyle(
                    fontSize: 15.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 8.0.sp),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  AppStrings.aboutBabyTemp,
                  style: TextStyle(
                    fontSize: 10.5.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// The method returns line series to chart.
  List<CartesianSeries<_ChartData, num>> _getGradientComparisonSeries() {
    return <CartesianSeries<_ChartData, num>>[
      ColumnSeries<_ChartData, num>(
        dataSource: <_ChartData>[
          _ChartData(0.5, 35),
          _ChartData(1.5, 37),
          _ChartData(2.5, 34.5),
          _ChartData(3.5, 35.5),
          _ChartData(4.5, 37),
          _ChartData(5.5, 39),
          _ChartData(6.5, 37.5),
          _ChartData(7.5, 35),
          _ChartData(8.5, 34.4),
        ],
        onCreateShader: (ShaderDetails details) {
          return ui.Gradient.linear(
            details.rect.topCenter,
            details.rect.bottomCenter,
            const <Color>[Colors.red, Colors.orange, Colors.yellow],
            <double>[0.3, 0.6, 0.9],
          );
        },
        name: 'Baby Temp',
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
        dataLabelSettings: const DataLabelSettings(offset: Offset(0, -5)),
      ),
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final num x;
  final double y;
}
