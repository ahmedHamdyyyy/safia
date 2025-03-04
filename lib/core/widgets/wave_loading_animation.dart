import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';

class WaveLoadingAnimation extends StatelessWidget {
  const WaveLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: MyColors.blue500, width: 2),
        ),
        child: WaveWidget(
          config: CustomConfig(
            gradients: [
              [MyColors.blue50, MyColors.blue200],
              [MyColors.blue200, MyColors.blue300],
              [MyColors.blue300, MyColors.blue500],
              [MyColors.blue500, MyColors.blue700],
            ],
            durations: [35000, 19440, 10800, 6000],
            heightPercentages: [0.20, 0.23, 0.25, 0.30],
            blur: const MaskFilter.blur(BlurStyle.solid, 10),
            gradientBegin: Alignment.bottomLeft,
            gradientEnd: Alignment.topRight,
          ),
          waveAmplitude: 0,
          size: const Size(100, 100),
        ),
      ),
    );
  }
} 