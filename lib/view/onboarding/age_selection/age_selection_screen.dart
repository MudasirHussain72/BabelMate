import 'package:babel_mate/utils/routes/routes_barrel_file.dart';
import 'package:babel_mate/view/view_barrel_file.dart';

class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'go to',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        Navigator.pushNamed(context, RouteName.signUpScreen),
                  text: 'signup screen',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryTextColor)),
            ],
          ),
        ),
      ),
    );
  }
}
