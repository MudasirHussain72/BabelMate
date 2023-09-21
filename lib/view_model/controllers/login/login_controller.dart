import '../view_model_barrel_file.dart';

class LoginController with ChangeNotifier {
  //repo reference from widget repository
  final LoginRepository _repository = LoginRepository();
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

  Future<void> login() async {
    try {
      setLoading(true);
      var data = {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      };
      final response = await _repository.loginApi(data);

      // Handle the response here based on your API's behavior
      if (response != null) {
        // Login was successful, handle success logic here.
        // You can also return a success message or user data.
        // Example: return response;
        print(response);
        Utils.toasstMessage('Login was successful');
        setLoading(false);
      } else {
        // Login failed, handle error logic here.
        // Example: throw Exception('Login failed');
        Utils.toasstMessage('Login failed');
        setLoading(false);
      }
    } catch (error) {
      print(error);
      // Handle exceptions and errors here.
      // Example: throw Exception('Error occurred: $error');
      Utils.toasstMessage('Error occurred: $error');
      setLoading(false);
    }
    setLoading(false);
  }
}
