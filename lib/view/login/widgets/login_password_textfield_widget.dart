import 'package:babel_mate/view/view_barrel_file.dart';

class LoginPasswordTextFieldWidget extends StatelessWidget {
  bool selected;
  LoginPasswordTextFieldWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 1;
    return Consumer<LoginController>(
        builder: (context, provider, child) => AnimatedPositioned(
            top: selected
                ? MediaQuery.of(context).size.height * .30
                : MediaQuery.of(context).size.height / .6,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: SizedBox(
              height: 100,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormFieldWidget(
                  controller: provider.passwordController,
                  focusNode: provider.passwordFocusNode,
                  hintText: 'Password',
                  prefixIcon: Icons.lock_outlined,
                  onFiledSubmittedValue: (newValue) {},
                ),
              ),
            )));
  }
}
