class LanguagesModel {
  List<Languages>? languages;

  LanguagesModel({this.languages});

  LanguagesModel.fromJson(Map<String, dynamic> json) {
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(new Languages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.languages != null) {
      data['languages'] = this.languages!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isoCode'] = this.isoCode;
    data['name'] = this.name;
    data['isSelected'] = this.isSelected; // Include isSelected in the JSON data
    return data;
  }
}
