import 'dart:convert';

List<StudentData> studentDataFromJson(String str) => List<StudentData>.from(
    json.decode(str).map((x) => StudentData.fromJson(x)));

String studentDataToJson(List<StudentData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentData {
  StudentData(
      {required this.id,
      required this.attendDate,
      required this.status,
      required this.studentId,
      required this.studentName});
  int id;
  String attendDate;
  String status;
  int studentId;
  String studentName;

  // bool attended;

  factory StudentData.fromJson(Map<String, dynamic> json) {
    return StudentData(
      id: int.parse(json['id']),
      attendDate: json['attendDate'],
      status: json['status'],
      studentId: int.parse(json['studentId']),
      studentName: json['studentName'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'attendDate': attendDate,
        'status': status,
        'studentId': studentId.toString(),
        'studentName': studentName,
      };
}
