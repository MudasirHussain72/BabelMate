import 'package:babel_mate/view_model/controllers/view_model_barrel_file.dart';

class OtpController with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  //repo reference from widget repository
  final VerifyAccountRepository _repository = VerifyAccountRepository();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  bool _loading = false;
  bool get loading => _loading;
  int? _otpFromServer;
  int? get otpFromServer => _otpFromServer;
  int? _otpFromUser;
  int? get otpFromUser => _otpFromUser;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setServerOtp(int value) {
    _otpFromServer = value;
    notifyListeners();
  }

  setUserOtp(int value) {
    _otpFromUser = value;
    notifyListeners();
  }

  // sendOTP func
  Future<void> sendOTP(BuildContext context) async {
    try {
      setLoading(true);
      var user = {'email': SessionController().user.email!.trim().toString()};
      final response = await _repository.signupApi(user);
      if (response != null) {
        if (response['message'] == 'success') {
          setServerOtp(response['otp']);
          Utils.toasstMessage('otp sent successfully');
        } else {
          Utils.toasstMessage('otp failed');
        }
      } else {
        Utils.toasstMessage('otp failed');
      }
      setLoading(false);
    } catch (error) {
      print(error);
      Utils.toasstMessage('Error occurred: $error');
      setLoading(false);
    }
  }

  // verifyOTP func
  Future<void> verifyOTP(BuildContext context) async {
    try {
      setLoading(true);
      var user = {'email': SessionController().user.email!.trim().toString()};
      final response = await _repository.signupApi(user);
      if (response != null) {
        if (response['message'] == 'success') {
          setServerOtp(response['otp']);
          Utils.toasstMessage('otp sent successfully');
        } else {
          Utils.toasstMessage('otp failed');
        }
      } else {
        Utils.toasstMessage('otp failed');
      }
      setLoading(false);
    } catch (error) {
      print(error);
      Utils.toasstMessage('Error occurred: $error');
      setLoading(false);
    }
  }

}
