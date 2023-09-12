import 'package:babel_mate/res/fonts/fonts.dart';
import 'package:babel_mate/view/view_barrel_file.dart';

class GetStartedCirclePainter extends CustomPainter {
  final Paint lightBluePaint = Paint()
    ..color = AppColors.secondaryColor.withOpacity(0.5);
  final Paint bluePaint = Paint()..color = AppColors.secondaryColor;
  final TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );

  final TextStyle textStyle = TextStyle(
    fontSize: 17,
    fontFamily: AppFonts.pangramSansMedium,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromLTRB(
        -100, size.height - 120, size.width * 0.7, size.height + 250);

    final Path circle = Path()..addOval(rect);
    final Path smallCircle = Path()..addOval(rect.inflate(50));

    canvas.drawPath(smallCircle, lightBluePaint);
    canvas.drawPath(circle, bluePaint);

    drawText(canvas, size, 'GET STARTED');
  }

  void drawText(Canvas canvas, Size size, String text) {
    textPainter.text = TextSpan(
      style: textStyle,
      text: text,
      recognizer: TapGestureRecognizer()
        ..onTap = () => print('/////////////////////////////Tap Here onTap'),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(50, size.height - 60));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
