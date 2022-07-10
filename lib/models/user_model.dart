// ignore_for_file: file_names

class UserModel {
  int id;
  String firstname;
  String lastname;
  String address;
  String password;

  UserModel({
    this.id,
    this.firstname,
    this.lastname,
    this.address,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        address: json['address'],
        password: json['password']);
  }
}
