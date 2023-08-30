import 'dart:async';
import 'package:babel_mate/view/onboarding/get_started/get_started_screen.dart';
import '../../../view/view_barrel_file.dart';

class SplashServices {
  /* function to check if user is already login or not
  * also we will checking if user has completed profile section or not
  * if profile is not completed we will direct user to their screen
  * if profile and search section is complete it will take you the home screen
  */

  void isUserLogin(BuildContext context) {
    Timer.periodic(const Duration(milliseconds: 900), (timer) {
      timer.cancel();

      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return CustomTransition(
              scale: animation,
              child: GetStartedScreen(animation: animation),
            );
          },
          transitionDuration: const Duration(milliseconds: 750),
          reverseTransitionDuration: const Duration(milliseconds: 750)));
    });
    //navigating user to dashboard if he is already login
  }
}

class CustomTransition extends AnimatedWidget {
  const CustomTransition({
    super.key,
    required Animation<double> scale,
    this.child,
  }) : super(listenable: scale);

  Animation<double> get scale => listenable as Animation<double>;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200.withOpacity(0.8),
      child: ClipPath(
        clipper: TriangleClipper(value: scale.value),
        child: child,
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  const TriangleClipper({
    required this.value,
  });
  final double value;
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width, (0 - size.height * 0.5));
    path.lineTo(size.width, size.height - size.height * value * 1.5);
    path.lineTo(
        0, (size.height + size.height * 0.2) - size.height * value * 1.2);
    path.close();

    return Path.combine(
        PathOperation.difference, Path()..addRect(Rect.largest), path);
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => true;
}
