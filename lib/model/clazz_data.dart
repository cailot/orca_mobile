import 'dart:convert';

List<ClazzData> clazzDataFromJson(String str) =>
    List<ClazzData>.from(json.decode(str).map((x) => ClazzData.fromJson(x)));

String clazzDataToJson(List<ClazzData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClazzData {
  ClazzData(
      {required this.id,
      required this.name,
      required this.grade,
      required this.number,
      this.description,
      required this.day});

  int id;
  String name;
  String grade;
  int number;
  String? description;
  String day;

  factory ClazzData.fromJson(Map<String, dynamic> json) {
    return ClazzData(
      id: int.parse(json['id']),
      name: json['name'],
      grade: json['grade'],
      number: int.parse(json['number']),
      description: json['description'],
      day: json['day'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'name': name,
        'grade': grade,
        'number': number.toString(),
        'description': description,
        'day': day
      };
}
