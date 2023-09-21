import 'package:babel_mate/view/view_barrel_file.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
          child: Consumer<SignUpController>(
              builder: (context, provider, child) => Form(
                    key: provider.formKey,
                    child: Stack(
                      children: [
                        // Animated Signup Text Widget
                        SignupTextWidget(selected: selected),
                        // Animated username Text Field Widget
                        SignupUsernameTextFieldWidget(selected: selected),
                        // Animated Name Text Field Widget
                        SignupNameTextFieldWidget(selected: selected),
                        // Animated Email Text Field Widget
                        SignupEmailTextFieldWidget(selected: selected),
                        // Animated Password Text Field Widget
                        SignupPasswordTextFieldWidget(selected: selected),
                        // Animated SIGN UP Button Field Widget
                        SignupButtonWidget(selected: selected),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
