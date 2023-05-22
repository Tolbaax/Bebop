import 'package:bebop/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../../core/utils/app_color.dart';

class CustomCircleIndicator extends StatelessWidget {
  final String text1;

  const CustomCircleIndicator({Key? key, required this.text1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: context.width * 0.75,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.01),
            AppColors.hint,
            AppColors.primary.withOpacity(0.02),
          ],
          stops: const [0.0, 0.5, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            axisLineStyle: AxisLineStyle(
              thickness: 0.2,
              cornerStyle: CornerStyle.bothCurve,
              color: AppColors.grey,
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: 60,
                width: 0.2,
                sizeUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.bothCurve,
                color: AppColors.primary,
                enableAnimation: true,
                animationDuration: 1200,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '02s Left\n',
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      color: AppColors.black.withOpacity(0.7),
                      letterSpacing: 1,
                    ),
                    children: [
                      TextSpan(
                        text: '$text1\n',
                        style: TextStyle(
                          height: 0.18.h,
                          fontSize: 24.0.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'BPM',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          color: AppColors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                positionFactor: 0.1.sp,
                angle: 90.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
