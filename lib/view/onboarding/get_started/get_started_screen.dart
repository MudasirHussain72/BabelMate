import 'package:flutter/material.dart';

class GetStartedScreen extends StatefulWidget {
  final Animation<double> animation;
  const GetStartedScreen({super.key, required this.animation});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen>
    with TickerProviderStateMixin {
  bool visible = false;
  @override
  void initState() {
    super.initState();
    widget.animation.addListener(() {
      if (widget.animation.value > .3) {
        setState(() {
          visible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: CirclePainter(),
        child: Center(
          child: Text(
            'get started Screen',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 20, color: Colors.teal),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Paint lightBluePaint = Paint()..color = Color(0xFFbde5fa);
  final Paint bluePaint = Paint()..color = Color(0xFF5abef2);
  final TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );

  final TextStyle textStyle = TextStyle(
      color: Colors.white.withAlpha(240),
      fontSize: 18,
      letterSpacing: 1.2,
      fontWeight: FontWeight.w900);

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
    textPainter.text = TextSpan(style: textStyle, text: text);
    textPainter.layout();
    textPainter.paint(canvas, Offset(50, size.height - 60));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
