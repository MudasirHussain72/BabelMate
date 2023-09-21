import 'package:babel_mate/view/login/widgets/login_button_widget.dart';
import 'package:babel_mate/view/login/widgets/login_email_textfield_widget.dart';
import 'package:babel_mate/view/login/widgets/login_password_textfield_widget.dart';
import 'package:babel_mate/view/login/widgets/login_text_widget.dart';
import 'package:babel_mate/view/view_barrel_file.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool selected = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => selected = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 1;
    var height = MediaQuery.of(context).size.height * .8;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              // Animated Login Text Widget
              LoginTextWidget(selected: selected),
              // Animated Email Text Field Widget
              LoginEmailTextFieldWidget(selected: selected),
              // Animated Password Text Field Widget
              LoginPasswordTextFieldWidget(selected: selected),
              // Animated SIGN UP Button Field Widget
              LoginButtonWidget(selected: selected),
            ],
          ),
        ),
      ),
    );
  }
}
