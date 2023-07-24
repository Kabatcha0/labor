class AuthModel {
  late String phone;
  late String name;
  late String uid;
  late String password;
  late String profile;

  AuthModel({
    required this.name,
    required this.phone,
    required this.uid,
    required this.password,
    required this.profile,
  });
  AuthModel.fromJson(Map<String, dynamic> json) {
    phone = json["phone"];
    name = json["name"];
    password = json["password"];
    uid = json["uid"];
    profile = json["profile"];
  }
  Map<String, dynamic> toMap({
    required String phone,
    required String name,
    required String uid,
    required String password,
    required String profile,
  }) {
    return {
      "phone": phone,
      "name": name,
      "uid": uid,
      "password": password,
      "profile": profile
    };
  }
}
