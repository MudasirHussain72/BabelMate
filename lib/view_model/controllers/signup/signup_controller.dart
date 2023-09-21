import 'package:babel_mate/models/user_model/user_model.dart';
import 'package:babel_mate/repository/signup_repository/signup_repository.dart';
import 'package:babel_mate/utils/routes/routes_barrel_file.dart';
import 'package:babel_mate/utils/utils.dart';
import 'package:babel_mate/view_model/services/session_controller.dart';

class SignUpController with ChangeNotifier {
  //repo reference from widget repository
  final SignUpRepository _repository = SignUpRepository();
  final formKey = GlobalKey<FormState>();
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

  // signup func
  Future<void> signup(BuildContext context) async {
    try {
      setLoading(true);
      var user = {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'username': userNameController.text.trim(),
        'first_name': nameController.text.trim(),
        'last_name': nameController.text.trim(),
        "age": '19',
        // "user_languages": ["urdu", "punjabi"], // List of strings
        // "exchange_languages": ["french", "english"], // List of strings
        // "interests": ["tech", "swimming"], // List of strings
      };
      final response = await _repository.signupApi(user);
      if (response != null) {
        if (response['message'] == 'success') {
          UserModel userData =
              UserModel(
                token: response['token'], userId: response['user_id']);
          await SessionController.saveUserInPreference(userData, false);
          await SessionController.getUserFromPreference();
          print(response);
          Navigator.pushNamed(context, RouteName.otpScreen);
          Utils.toasstMessage('Signup was successful');
        } else if (response['message'] == 'Email already exists') {
          Utils.toasstMessage('Email already exists');
        } else if (response['message'] == 'Username already exists') {
          Utils.toasstMessage('Username already exists');
        } else {
          Utils.toasstMessage('Signup failed');
        }
      } else {
        Utils.toasstMessage('Signup failed');
      }
      setLoading(false);
    } catch (error) {
      print(error);
      Utils.toasstMessage('Error occurred: $error');
      setLoading(false);
    }
  }
}
