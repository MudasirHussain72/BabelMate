import 'package:babel_mate/res/assets_name/image_assets.dart';
import 'package:babel_mate/view_model/services/splash_services/splash_services.dart';
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
      backgroundColor: Colors.grey.shade200.withOpacity(0.8),
      body: Center(
        child: SvgPicture.asset(
          ImageAssets.splashLogo,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
