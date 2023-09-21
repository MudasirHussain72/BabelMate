import 'package:babel_mate/view/view_barrel_file.dart';

class OtpButtonWidget extends StatelessWidget {
  bool selected;
  OtpButtonWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 1;
    return Consumer<OtpController>(
        builder: (context, provider, child) => AnimatedPositioned(
            top: selected
                ? MediaQuery.of(context).size.height * .30
                : MediaQuery.of(context).size.height / .5,
            left: MediaQuery.of(context).size.width * .06,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: SizedBox(
              height: 50,
              width: width / 2.5,
              child: RoundButton(
                loading: provider.loading,
                title: 'Verify',
                onPress: () {
                  if (provider.formKey.currentState!.validate()) {
                    // provider.verify(context);
                  }
                },
                borderRadius: 50,
                textColor: AppColors.primaryColor,
                buttonColor: AppColors.secondaryColor,
              ),
            )));
  }
}
