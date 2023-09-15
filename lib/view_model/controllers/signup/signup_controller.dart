import 'package:babel_mate/utils/routes/routes_barrel_file.dart';

class SignUpController with ChangeNotifier {
  //repo reference from widget repository
  // final _repo = CreateProfileRepository();
  final userNameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _loading = false;
  bool get loading => _loading;
  bool _selected = false;
  bool get selected => _selected;
  bool _showPass = false;
  bool get showPass => _showPass;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSelected(bool value) {
    _selected = value;
    notifyListeners();
  }

  setShowPass(bool value) {
    _showPass = value;
    notifyListeners();
  }
}
