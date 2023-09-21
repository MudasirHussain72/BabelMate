import 'package:babel_mate/view/view_barrel_file.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool selected = false;
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<OtpController>(context, listen: false);
    provider.sendOTP(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => selected = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 1;
    var height = MediaQuery.of(context).size.height * .8;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: SizedBox(
          width: width,
          height: height,
          child: Consumer<OtpController>(
              builder: (context, provider, child) => Form(
                    key: provider.formKey,
                    child: Stack(
                      children: [
                        // Animated Signup Text Widget
                        OtpTextWidget(selected: selected),
                        // Animated username Text Field Widget
                        EnterOtpFieldWidget(selected: selected),
                        //Resend text widget
                        ResendCodeWidget(selected: selected),
                        // // Animated SIGN UP Button Field Widget
                        OtpButtonWidget(selected: selected),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
