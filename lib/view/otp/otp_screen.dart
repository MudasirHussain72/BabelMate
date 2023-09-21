import 'package:babel_mate/view/otp/widgets/enter_otp_field_widget.dart';
import 'package:babel_mate/view/otp/widgets/otp_button_widget.dart';
import 'package:babel_mate/view/otp/widgets/otp_text_widget.dart';
import 'package:babel_mate/view/otp/widgets/resend_code_widget.dart';
import 'package:babel_mate/view/view_barrel_file.dart';
import 'package:babel_mate/view_model/controllers/otp/otp_controller.dart';

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
