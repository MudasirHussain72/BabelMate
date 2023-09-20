import 'package:babel_mate/data/remote/network/network_api_services.dart';
import 'package:babel_mate/res/app_url/app_urls.dart';

class SignUpRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> signupApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.signupApi);
    return response;
  }
}
