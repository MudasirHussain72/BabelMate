import 'package:babel_mate/utils/routes/routes_barrel_file.dart';
import 'package:babel_mate/view/view_barrel_file.dart';

class SignupTextWidget extends StatelessWidget {
  bool selected;
  SignupTextWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpController>(
        builder: (context, provider, child) => AnimatedPositioned(
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
                      style:
                          Theme.of(context).textTheme.displaySmall!.copyWith(),
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
                                    color: AppColors.secondaryColor)),
                      ])),
            ));
  }
}
