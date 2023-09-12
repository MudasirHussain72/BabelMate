import 'package:babel_mate/utils/routes/routes_barrel_file.dart';
import 'package:babel_mate/view/view_barrel_file.dart';

class GetStartedScreen extends StatefulWidget {
  final Animation<double> animation;
  const GetStartedScreen({super.key, required this.animation});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen>
    with TickerProviderStateMixin {
  bool visible = false;
  bool selected = false;
  @override
  void initState() {
    super.initState();
    widget.animation.addListener(() {
      if (widget.animation.value > .3) {
        setState(() {
          visible = true;
        });
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selected = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: selected ? 10.0 : MediaQuery.of(context).size.height / 1.1,
            right: 10,
            child: RichText(
              text: TextSpan(
                text: 'Already using BabelMate? ',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w400),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryTextColor)),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            width: selected ? 200.0 : 200.0,
            height: selected ? 100 : 6,
            top: selected ? 150.0 : MediaQuery.of(context).size.height / 1.1,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: SvgPicture.asset(
              ImageAssets.getStartedLogo,
              width: 100,
              height: 100,
            ),
          ),
          AnimatedPositioned(
            top: selected ? 260.0 : MediaQuery.of(context).size.height / 1.1,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RichText(
                  text: TextSpan(
                      text: 'Hi! Ready to learn a language\nthe fun way?\n',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          height: 0,
                          fontSize: MediaQuery.of(context).size.width * .07),
                      children: <TextSpan>[
                    TextSpan(
                        text: 'Let\'s set up your profile.',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.w400))
                  ])),
            ),
          ),
          //get started button
          GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, RouteName.userLanguagesSelectionScreen),
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
              painter: GetStartedCirclePainter(),
            ),
          ),
        ],
      ),
    ));
  }
}
