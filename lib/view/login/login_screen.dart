import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Animation<double> animation;
  const LoginScreen({super.key, required this.animation});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
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
      body: Center(
        child: Text(
          'Login Screen',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 20, color: Colors.teal),
        ),
      ),
    );
  }
}
