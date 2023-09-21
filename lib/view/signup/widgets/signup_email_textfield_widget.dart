import 'package:babel_mate/view/view_barrel_file.dart';

class SignupEmailTextFieldWidget extends StatelessWidget {
  bool selected;
  SignupEmailTextFieldWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 1;
    return Consumer<SignUpController>(
        builder: (context, provider, child) => AnimatedPositioned(
            top: selected
                ? MediaQuery.of(context).size.height * .38
                : MediaQuery.of(context).size.height / .7,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: SizedBox(
              height: 100,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormFieldWidget(
                  controller: provider.emailController,
                  focusNode: provider.emailFocusNode,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  onFiledSubmittedValue: (newValue) => Utils.fieldFocus(context,
                      provider.emailFocusNode, provider.passwordFocusNode),
                ),
              ),
            )));
  }
}
