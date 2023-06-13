import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BloodPressureGauge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double bloodPressure = generateRandomBloodPressure();
    return _buildBloodPressureGauge(bloodPressure);
  }

  SfRadialGauge _buildBloodPressureGauge(double bloodPressure) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          showAxisLine: false,
          ticksPosition: ElementsPosition.outside,
          labelsPosition: ElementsPosition.outside,
          radiusFactor: 0.9,
          canRotateLabels: true,
          showLastLabel: true,
          majorTickStyle: MajorTickStyle(
            length: 0.1,
            lengthUnit: GaugeSizeUnit.factor,
          ),
          minorTickStyle: MinorTickStyle(
            length: 0.04,
            lengthUnit: GaugeSizeUnit.factor,
          ),
          minorTicksPerInterval: 5,
          interval: 10,
          axisLabelStyle: GaugeTextStyle(),
          useRangeColorForAxis: true,
          pointers: <GaugePointer>[
            NeedlePointer(
              enableAnimation: true,
              value: bloodPressure,
              tailStyle: TailStyle(length: 0.2, width: 5),
              needleEndWidth: 5,
              needleLength: 0.7,
            ),
          ],
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 25,
              endValue: 100,
              startWidth: 0.05,
              gradient: SweepGradient(
                colors: <Color>[Color(0xFF289AB1), Color(0xFF43E695)],
                stops: <double>[0.25, 0.75],
              ),
              color: const Color(0xFF289AB1),
              rangeOffset: 0.08,
              endWidth: 0.2,
              sizeUnit: GaugeSizeUnit.factor,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 90,
              positionFactor: 1,
              widget: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Blood Pressure:',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times',
                    ),
                  ),
                  Text(
                    ' $bloodPressure/80 mmHg',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFF289AB1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  double generateRandomBloodPressure() {
    final random = Random();
    final systolicPressure = 90 + random.nextInt(31);
    return systolicPressure.toDouble();
  }
}
