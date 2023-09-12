import 'package:babel_mate/data/remote/network/network_api_services.dart';
import 'package:babel_mate/models/lang_model/lang_model.dart';
import 'package:babel_mate/res/app_url/app_urls.dart';

class GetLangRepository {
  final _apiService = NetworkApiServices();
  Future<LanguagesModel> getLangApi() async {
    final url = AppUrl.languagesApi;
    final jsonResponse = await _apiService.getApi(url);
    print('JSON Response: $jsonResponse'); // Debugging line
    LanguagesModel response = LanguagesModel.fromJson(jsonResponse);
    return response;
  }
}
