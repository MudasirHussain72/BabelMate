import 'package:babel_mate/view/view_barrel_file.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class EnterOtpFieldWidget extends StatelessWidget {
  bool selected;
  EnterOtpFieldWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpController>(
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
                  fieldWidth: MediaQuery.of(context).size.width * .155,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        });
                  }, // end onSubmit
                ),
              ),
            ));
  }
}
