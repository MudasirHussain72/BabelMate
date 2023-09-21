import 'package:babel_mate/view/view_barrel_file.dart';

// ignore: must_be_immutable
class LinearPercentIndicatorWidget extends StatelessWidget {
  double percent;
  LinearPercentIndicatorWidget({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      animateFromLastPercent: true,
      backgroundColor: AppColors.onboardPercentIndicatorColor,
      progressColor: AppColors.secondaryColor,
      percent: percent,
    );
  }
}
