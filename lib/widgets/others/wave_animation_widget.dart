import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:sales_app/themes/themes.dart';

class WaveAnimationWidget extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final double? waveAmplitude;
  const WaveAnimationWidget({
    super.key,
    this.primaryColor = ThemeColors.blue1,
    this.secondaryColor = ThemeColors.purple1,
    this.waveAmplitude,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 1,
      child: RotatedBox(
        quarterTurns: 2,
        child: WaveWidget(
          config: CustomConfig(
            gradients: [
              [
                primaryColor.withOpacity(.6),
                secondaryColor.withOpacity(.6),
              ],
              [
                primaryColor.withOpacity(.4),
                secondaryColor.withOpacity(.4),
              ],
              [
                primaryColor.withOpacity(.2),
                secondaryColor.withOpacity(.2),
              ],
              [
                primaryColor,
                secondaryColor,
              ],
            ],
            durations: [35000, 10800, 10800, 35000],
            heightPercentages: [0.3, 0.25, 0.25, 0.3],
            gradientBegin: Alignment.bottomLeft,
            gradientEnd: Alignment.topRight,
          ),
          size: const Size(
            double.infinity,
            double.infinity,
          ),
          waveAmplitude: waveAmplitude ?? 5,
        ),
      ),
    );
  }
}
