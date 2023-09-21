import 'package:babel_mate/view/view_barrel_file.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    //calling function to check if user is already widget or in splash screen
    splashServices.isUserLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.8),
      body: Center(
        child: SvgPicture.asset(
          ImageAssets.splashLogo,
          width: 50,
          height: 50,
          // color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
