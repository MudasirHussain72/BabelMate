import 'package:babel_mate/view/view_barrel_file.dart';

class SignupUsernameTextFieldWidget extends StatelessWidget {
  const SignupUsernameTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 1;
    return Consumer<SignUpController>(
        builder: (context, provider, child) => AnimatedPositioned(
            top: provider.selected
                ? MediaQuery.of(context).size.height * .22
                : MediaQuery.of(context).size.height / .9,
            // right: MediaQuery.of(context).size.width / 3.4,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: SizedBox(
              height: 100,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormFieldWidget(
                  controller: provider.userNameController,
                  focusNode: provider.userNameFocusNode,
                  hintText: 'Username',
                  prefixIcon: Icons.alternate_email_rounded,
                  onFiledSubmittedValue: (newValue) => Utils.fieldFocus(context,
                      provider.userNameFocusNode, provider.nameFocusNode),
                ),
              ),
            )));
  }
}
