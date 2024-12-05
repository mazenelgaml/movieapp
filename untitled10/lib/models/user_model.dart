class UserModel {
  final String? userName;
  final String? emailAddress;
  final String? password;
  final String? phoneNumber;

  UserModel(
      {this.userName, this.emailAddress, this.password, this.phoneNumber});

  factory UserModel.fromJason(Map<String, dynamic> json) =>
      UserModel(
        userName: json["userName"],
        emailAddress: json["emailAddress"],
        password: json["password"],
        phoneNumber: json['phoneNumber'],
      );

  Map<String, dynamic> toJson() =>
      {
        "userName": userName,
        "emailAddress": emailAddress,
        "password": password,
        "phoneNumber": phoneNumber,
      };
  factory UserModel.fromMap(Map<dynamic, dynamic> map) {
    return UserModel(
      userName: map["userName"] ?? '',
      emailAddress: map["emailAddress"] ?? '',
        password: map["password"] ?? '',
        phoneNumber:  map["phoneNumber"] ?? '',
    );
  }
}