import 'package:babel_mate/view/view_barrel_file.dart';

class ResendCodeWidget extends StatelessWidget {
  bool selected;
  ResendCodeWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Consumer<OtpController>(
        builder: (context, provider, child) => AnimatedPositioned(
              top: selected
                  ? MediaQuery.of(context).size.height * .26
                  : MediaQuery.of(context).size.height / .6,
              left: MediaQuery.of(context).size.width * .06,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      text: 'Did\'t get a code ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => provider.sendOTP(context),
                            text: 'Resend',
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
