import 'package:babel_mate/view_model/services/session_controller.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SessionController().user.userId.toString()),
      ),
      body: Center(
        child: Text(SessionController().user.token.toString()),
      ),
    );
  }
}
