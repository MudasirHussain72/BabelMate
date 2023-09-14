import 'package:babel_mate/utils/routes/routes_barrel_file.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: selected
                ? MediaQuery.of(context).size.height * .1
                : MediaQuery.of(context).size.height / 1.1,
            right: MediaQuery.of(context).size.width / 3,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Sign up\n',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Existing user? ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.w400)),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushNamed(
                                context, RouteName.loginScreen),
                          text: 'Login',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryTextColor)),
                    ])),
          ),
          AnimatedPositioned(
              top: selected
                  ? MediaQuery.of(context).size.height * .22
                  : MediaQuery.of(context).size.height / .9,
              // right: MediaQuery.of(context).size.width / 3.4,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: SizedBox(
                height: 50,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: AppColors.textfieldFilledColor,
                        hintText: 'Name',
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: const BorderSide(
                                color: AppColors.textFieldDefaultBorderColor,
                                width: 1.5)),
                        prefixIcon: Icon(Icons.person)),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
