import 'package:babel_mate/data/remote/network/network_api_services.dart';
import 'package:babel_mate/res/app_url/app_urls.dart';
import 'package:babel_mate/view/view_barrel_file.dart';

class GetLangRepository {
  final _apiService = NetworkApiServices();
  Future<LanguagesModel> getLangApi() async {
    final url = AppUrl.languagesApi;
    final jsonResponse = await _apiService.getApi(url);
    if (kDebugMode) {
      print('JSON Response: $jsonResponse');
    } // Debugging line
    LanguagesModel response = LanguagesModel.fromJson(jsonResponse);
    return response;
  }
}
