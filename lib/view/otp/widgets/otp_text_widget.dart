import 'package:babel_mate/view/view_barrel_file.dart';

class OtpTextWidget extends StatelessWidget {
  bool selected;
  OtpTextWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Consumer<OtpController>(
        builder: (context, provider, child) => AnimatedPositioned(
              top: selected
                  ? MediaQuery.of(context).size.height * .02
                  : MediaQuery.of(context).size.height / 1.1,
              left: MediaQuery.of(context).size.width * .06,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      text: 'Verification Code\n',
                      style:
                          Theme.of(context).textTheme.displaySmall!.copyWith(),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'We sent you a code to verify your email.\nPlease check your email and enter the code below',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontWeight: FontWeight.w400)),
                      ])),
            ));
  }
}
