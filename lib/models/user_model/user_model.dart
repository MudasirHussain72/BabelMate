class UserModel {
  String? sId;
  String? email;
  String? password;
  String? username;
  String? firstName;
  String? lastName;
  String? age;
  List<String>? userLanguages;
  List<String>? exchangeLanguages;
  List<String>? interests;
  String? userId;
  String? token;

  UserModel(
      {this.sId,
      this.email,
      this.password,
      this.username,
      this.firstName,
      this.lastName,
      this.age,
      this.userLanguages,
      this.exchangeLanguages,
      this.interests,
      this.userId,
      this.token});
      
  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    age = json['age'];

    // Check if these fields are present in the JSON data before casting.
    if (json.containsKey('user_languages') && json['user_languages'] != null) {
      userLanguages = json['user_languages'].cast<String>();
    }
    if (json.containsKey('exchange_languages') &&
        json['exchange_languages'] != null) {
      exchangeLanguages = json['exchange_languages'].cast<String>();
    }
    if (json.containsKey('interests') && json['interests'] != null) {
      interests = json['interests'].cast<String>();
    }

    userId = json['user_id'];
    token = json['token'];
  }

  toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['age'] = this.age;
    data['user_languages'] = this.userLanguages;
    data['exchange_languages'] = this.exchangeLanguages;
    data['interests'] = this.interests;
    data['user_id'] = this.userId;
    data['token'] = this.token;
    return data;
  }
}
