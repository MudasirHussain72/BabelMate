import 'package:babel_mate/view/view_barrel_file.dart';

class SignupButtonWidget extends StatelessWidget {
  bool selected;
  SignupButtonWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 1;
    return Consumer<SignUpController>(
        builder: (context, provider, child) => AnimatedPositioned(
            top: selected
                ? MediaQuery.of(context).size.height * .54
                : MediaQuery.of(context).size.height / .5,
            right: MediaQuery.of(context).size.width / 3.3,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: SizedBox(
              height: 50,
              width: width / 2.5,
              child: RoundButton(
                loading: provider.loading,
                title: 'SIGN UP',
                onPress: () {
                  if (provider.formKey.currentState!.validate()) {
                    provider.signup(context);
                  }
                },
                borderRadius: 50,
                textColor: AppColors.primaryColor,
                buttonColor: AppColors.secondaryColor,
              ),
            )));
  }
}
