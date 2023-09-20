import 'package:babel_mate/view/view_barrel_file.dart';

class LoginEmailTextFieldWidget extends StatelessWidget {
  bool selected;
  LoginEmailTextFieldWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 1;
    return Consumer<LoginController>(
        builder: (context, provider, child) => AnimatedPositioned(
            top: selected
                ? MediaQuery.of(context).size.height * .22
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
                  hintText: 'Email OR Username',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  onFiledSubmittedValue: (newValue) => Utils.fieldFocus(context,
                      provider.emailFocusNode, provider.passwordFocusNode),
                ),
              ),
            )));
  }
}
