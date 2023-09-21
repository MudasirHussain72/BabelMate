import 'package:babel_mate/view/view_barrel_file.dart';

class EnterOtpFieldWidget extends StatelessWidget {
  bool selected;
  EnterOtpFieldWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Consumer<OtpController>(
        builder: (context, provider, child) => AnimatedPositioned(
              top: selected
                  ? MediaQuery.of(context).size.height * .14
                  : MediaQuery.of(context).size.height / .7,
              left: MediaQuery.of(context).size.width * .06,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: SizedBox(
                height: MediaQuery.of(context).size.width * .172,
                child: OtpTextField(
                  numberOfFields: 5,
                  enabledBorderColor: AppColors.secondaryColor,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  borderWidth: 1,
                  fieldWidth: MediaQuery.of(context).size.width * .155,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    provider.setUserOtp(int.parse(verificationCode));
                  }, // end onSubmit
                ),
              ),
            ));
  }
}
