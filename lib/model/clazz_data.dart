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

  Map<String, dynamic> toJson() => {
    // final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    // data['name'] = name;
    // data['grade'] = grade;
    // data['number'] = number;
    // data['description'] = description;
    // data['day'] = day;
    // return data;
    'id': id.toString(),
    'name': name,
    'grade': grade,
    'number': number.toString(),
    'description': description,
    'day': day
  };

  // ClazzData.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   grade = json['grade'];
  //   number = json['number'];
  //   description = json['description'];
  //   day = json['day'];
  // }
}
