import 'package:babel_mate/models/user_model/user_model.dart';
import 'package:babel_mate/view_model/services/session_controller.dart';
import 'package:babel_mate/view_model/services/shared_preference.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences with ChangeNotifier {

  Future<bool> saveUser(var user) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferenceClass.setValue('user', user);
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    notifyListeners();
    return SessionController().user;
  }

  Future<bool> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    notifyListeners();
    SessionController().user = UserModel(userId: '');
    return prefs.clear();
  }

  setStates(){
    notifyListeners();
  }
}
