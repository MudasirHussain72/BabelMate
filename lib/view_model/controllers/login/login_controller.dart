import 'package:babel_mate/utils/routes/routes_barrel_file.dart';

class LoginController with ChangeNotifier {
  //repo reference from widget repository
  // final _repo = CreateProfileRepository();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _loading = false;
  bool get loading => _loading;
  bool _showPass = false;
  bool get showPass => _showPass;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setShowPass(bool value) {
    _showPass = value;
    notifyListeners();
  }
}
