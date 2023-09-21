class LanguagesModel {
  List<Languages>? languages;

  LanguagesModel({this.languages});

  LanguagesModel.fromJson(Map<String, dynamic> json) {
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Languages {
  String? isoCode;
  String? name;
  bool? isSelected;

  Languages({this.isoCode, this.name, this.isSelected = false});

  Languages.fromJson(Map<String, dynamic> json) {
    isoCode = json['isoCode'];
    name = json['name'];
    isSelected = false; // Initialize isSelected to false by default
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isoCode'] = isoCode;
    data['name'] = name;
    data['isSelected'] = isSelected; // Include isSelected in the JSON data
    return data;
  }
}
