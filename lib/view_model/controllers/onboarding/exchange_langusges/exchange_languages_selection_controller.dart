import '../../../../view/view_barrel_file.dart';

class ExchangeLanguagesSelectionController with ChangeNotifier {
  final _repo = GetLangRepository();
  ApiResponse<LanguagesModel> languages = ApiResponse.loading();
  setLanguages(ApiResponse<LanguagesModel> response) {
    languages = response;
    notifyListeners();
  }

  // Method to toggle the isSelected property for a language
  void toggleLanguageSelection(Languages? language) {
    language?.isSelected = !(language.isSelected ?? false);
    notifyListeners();
  }

  // A func to get the languages from api
  void getLanguagesApi() {
    _repo.getLangApi().then((value) {
      setLanguages(ApiResponse<LanguagesModel>.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setLanguages(ApiResponse.error(error.toString()));
    });
  }

  // A method to print the selected languages
  void printSelectedLanguages() {
    final selectedLanguages = languages.data?.languages
        ?.where((language) => language.isSelected ?? false)
        .toList();

    if (selectedLanguages != null && selectedLanguages.isNotEmpty) {
      for (var language in selectedLanguages) {
        if (kDebugMode) {
          print('Selected Language: ${language.name}');
        }
      }
    } else {
      if (kDebugMode) {
        print('No languages are selected.');
      }
    }
  }
}
