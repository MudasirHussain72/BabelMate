import 'package:babel_mate/view/view_barrel_file.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // bool selected = false;
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<SignUpController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // setState(() => selected = true);
      provider.setSelected(true);
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
          child: const Stack(
            children: [
              // Animated Signup Text Widget
              SignupTextWidget(),
              // Animated username Text Field Widget
              SignupUsernameTextFieldWidget(),
              // Animated Name Text Field Widget
              SignupNameTextFieldWidget(),
              // Animated Email Text Field Widget
              SignupEmailTextFieldWidget(),
              // Animated Password Text Field Widget
              SignupPasswordTextFieldWidget(),
              // Animated SIGN UP Button Field Widget
              SignupButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
