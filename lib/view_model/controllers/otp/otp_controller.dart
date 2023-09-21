import 'dart:convert';

import 'package:babel_mate/repository/get_user_data_repository/get_user_data_repository.dart';
import 'package:babel_mate/utils/routes/routes_barrel_file.dart';
import 'package:babel_mate/view_model/controllers/view_model_barrel_file.dart';

class OtpController with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  //repo reference from widget repository
  final VerifyAccountRepository _repository = VerifyAccountRepository();
  final GetUserDataRepository _getUserDataRepositoryrepository =
      GetUserDataRepository();
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
      final response = await _repository.verifyAccountApi(user);
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
    setLoading(true);
    if (_otpFromServer == _otpFromUser) {
      try {
        setLoading(true);
        var tokens = {
          "user_id": SessionController().user.userId,
          "token": SessionController().user.token,
        };
        final response =
            await _getUserDataRepositoryrepository.getUserDataApi(tokens);
        if (response != null) {
          // if (response['message'] == 'success') {
          UserModel userData = UserModel.fromJson(response);
          await SessionController.saveUserInPreference(userData, true);
          await SessionController.getUserFromPreference();
          print(response);
          Navigator.pushNamed(context, RouteName.dashboardView);
          Utils.toasstMessage('verification successful');
          // } else if (response['msg']['message'] == 'invalid token') {
          //   Utils.toasstMessage('invalid token');
          // } else if (response['message'] == 'User does not exist') {
          //   Utils.toasstMessage('User does not exist');
          // } else {
          //   Utils.toasstMessage('verification failed');
          // }
        } else {
          Utils.toasstMessage('verification failed');
        }
        setLoading(false);
      } catch (error) {
        print(error);
        Utils.toasstMessage('Error occurred: $error');
        setLoading(false);
      }
    } else {
      Utils.toasstMessage('Please enter correct OTP');
    }
    setLoading(false);
  }
}
