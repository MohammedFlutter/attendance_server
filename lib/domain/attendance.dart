import 'student.dart';

class Attendance {
  final String history ;

  final List<Student> students;

  Attendance._(this.history, this.students);
  factory Attendance.fromJson (Map<String, dynamic> json){
    var temp= json['students'] as List<Map<String,dynamic>>;
    return Attendance._(json['history'], temp.map((e) => Student.fromJson(e)).toList());
  }
  Map<String ,dynamic> toJson(){
    return {
      'history':history,
      'students':students.map((e) => e.toJson()).toList(),
    };
  }
}