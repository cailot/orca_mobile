import 'dart:convert';

List<StudentData> studentDataFromJson(String str) => List<StudentData>.from(
    json.decode(str).map((x) => StudentData.fromJson(x)));

String studentDataToJson(List<StudentData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentData {
  StudentData(
      {required this.id,
      required this.status,
      required this.studentId,
      required this.studentName});
  int id;
  String status;
  int studentId;
  String studentName;

  factory StudentData.fromJson(Map<String, dynamic> json) {
    return StudentData(
      id: int.parse(json['id']),
      status: json['status'],
      studentId: int.parse(json['studentId']),
      studentName: json['studentName'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'status': status,
        'studentId': studentId.toString(),
        'studentName': studentName,
      };
}
