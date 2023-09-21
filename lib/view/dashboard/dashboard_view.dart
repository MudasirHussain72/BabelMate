import 'package:babel_mate/view_model/controllers/view_model_barrel_file.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(SessionController().isLogin.toString()),
          Text(SessionController().user.age.toString()),
          Text(SessionController().user.email.toString()),
          Text(SessionController().user.exchangeLanguages.toString()),
          Text(SessionController().user.firstName.toString()),
          Text(SessionController().user.lastName.toString()),
          Text(SessionController().user.password.toString()),
          Text(SessionController().user.sId.toString()),
          Text(SessionController().user.token.toString()),
          Text(SessionController().user.userId.toString()),
          Text(SessionController().user.userLanguages.toString()),
          Text(SessionController().user.username.toString()),
        ],
      ),
    );
  }
}
