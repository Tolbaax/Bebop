import 'dart:math';

import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HeartRateGauge extends StatelessWidget {
  const HeartRateGauge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int heartRate = generateRandomHeartRate();
    return _buildRadialGauge(context, heartRate);
  }

  SfRadialGauge _buildRadialGauge(BuildContext context, int heartRate) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 200,
        interval: 20,
        radiusFactor: MediaQuery.of(context).orientation == Orientation.portrait
            ? 0.6
            : 0.5,
        canRotateLabels: true,
        showLastLabel: true,
        minorTickStyle: const MinorTickStyle(
          color: Color(0xFF00A8B5),
          lengthUnit: GaugeSizeUnit.factor,
          length: 0.07,
        ),
        majorTickStyle: const MajorTickStyle(
          color: Color(0xFF00A8B5),
          lengthUnit: GaugeSizeUnit.factor,
          length: 0.15,
        ),
        axisLineStyle: const AxisLineStyle(
          color: Color(0xFF00A8B5),
          thickness: 3,
        ),
        axisLabelStyle: const GaugeTextStyle(color: Color(0xFF00A8B5)),
      ),
      RadialAxis(
        interval: 10,
        showLastLabel: true,
        ticksPosition: ElementsPosition.outside,
        labelsPosition: ElementsPosition.outside,
        minorTicksPerInterval: 5,
        minorTickStyle: const MinorTickStyle(
          length: 0.07,
          lengthUnit: GaugeSizeUnit.factor,
        ),
        majorTickStyle: const MinorTickStyle(
          length: 0.15,
          lengthUnit: GaugeSizeUnit.factor,
        ),
        axisLineStyle: const AxisLineStyle(
          thickness: 3,
        ),
        axisLabelStyle: const GaugeTextStyle(),
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
            angle: 90,
            positionFactor: 1,
            widget: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '${AppStrings.heartRate}:',
                  style: TextStyle(
                    fontSize: 10.0.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times',
                  ),
                ),
                Text(
                  ' $heartRate bpm',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF00A8B5),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times',
                  ),
                ),
              ],
            ),
          ),
        ],
        pointers: <GaugePointer>[
          NeedlePointer(
            needleLength: 0.68,
            needleStartWidth: 0,
            needleEndWidth: 3,
            value: heartRate.toDouble(),
            enableAnimation: true,
            knobStyle: KnobStyle(
              knobRadius: 6.5,
              sizeUnit: GaugeSizeUnit.logicalPixel,
            ),
          ),
        ],
      ),
    ]);
  }

  int generateRandomHeartRate() {
    final random = Random();
    return 60 + random.nextInt(41);
  }
}
