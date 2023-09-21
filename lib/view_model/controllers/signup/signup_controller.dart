import 'package:babel_mate/utils/routes/routes_barrel_file.dart';
import '../view_model_barrel_file.dart';

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

      // Ensure that the text controllers have valid values
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final username = userNameController.text.trim();
      final firstName = nameController.text.trim();
      final lastName = nameController.text.trim();

      if (email.isEmpty ||
          password.isEmpty ||
          username.isEmpty ||
          firstName.isEmpty ||
          lastName.isEmpty) {
        Utils.toasstMessage('Please fill in all required fields');
        setLoading(false);
        return;
      }

      var user = {
        'email': email,
        'password': password,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        "age": '19',
      };

      final response = await _repository.signupApi(user);
      if (response != null) {
        if (response['message'] == 'success') {
          UserModel userData = UserModel(
            token: response['token'],
            userId: response['user_id'],
            email: email,
            username: username,
            firstName: firstName,
            lastName: lastName,
          );
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
