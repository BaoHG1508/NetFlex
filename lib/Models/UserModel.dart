// @dart=2.9

class UserModel {
  UserModel({this.name});

  String name;

  Map<String, dynamic> toJSON() => {
    "userName": name,
  };
}