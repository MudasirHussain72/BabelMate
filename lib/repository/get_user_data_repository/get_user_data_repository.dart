import 'package:babel_mate/data/remote/network/network_api_services.dart';
import 'package:babel_mate/res/app_url/app_urls.dart';

class GetUserDataRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> getUserDataApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.getUserData);
    return response;
  }
}
