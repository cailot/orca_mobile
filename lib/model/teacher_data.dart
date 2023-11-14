import 'dart:convert';

List<TeacherData> teacherDataFromJson(String str) => List<TeacherData>.from(
    json.decode(str).map((x) => TeacherData.fromJson(x)));

String teacherDataToJson(List<TeacherData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeacherData {
  TeacherData(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      this.password,
      required this.address,
      required this.vit});
  int id;
  String firstName;
  String lastName;
  String email;
  String? password;
  String phone;
  String address;
  String vit;

  factory TeacherData.fromJson(Map<String, dynamic> json) {
    return TeacherData(
        id: int.parse(json['id']),
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phone: json['phone'],
        password: json['password'],
        address: json['address'],
        vit: json['vit']);
  }

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'password': password,
        'address': address,
        'vit': vit
      };
}
