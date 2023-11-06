import 'dart:io';

void main() {
  showData();
}

void showData() {
  startTask();
  accessData();
  fetchData();
}

void startTask() {
  String info = 'startTask';
  print(info);
  // sleep(Duration(seconds: 3));
  // print(info);
}

void accessData() {
  Duration time = const Duration(seconds: 3);
  // sleep(time);
  Future.delayed(time, () {
    String info = 'accessData';
    print(info);
  });
  // sleep(Duration(seconds: 3));
  // print(info);
}

void fetchData() {
  String info = 'fetchData';
  print(info);
  // sleep(Duration(seconds: 3));
  // print(info);
}
