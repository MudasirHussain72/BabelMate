import 'package:babel_mate/res/constants.dart';
import 'package:babel_mate/res/theme/light_theme.dart';
import 'package:babel_mate/utils/routes/routes.dart';
import 'package:babel_mate/utils/routes/routes_barrel_file.dart';
import 'package:babel_mate/view/view_barrel_file.dart';
import 'package:babel_mate/view_model/controllers/signup/signup_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  //setting app orientation in portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UserLanguagesSelectionController()),
        ChangeNotifierProvider(
            create: (context) => ExchangeLanguagesSelectionController()),
        ChangeNotifierProvider(create: (context) => SignUpController()),
      ],
      child: MaterialApp(
        title: applicationName,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
