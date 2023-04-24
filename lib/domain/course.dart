
import 'package:attendance_server/domain/attendance.dart';

class Course {
  final String title ;

  final List<Attendance> attendances;

  Course(this.title, this.attendances);
  factory Course.fromJson (Map<String, dynamic> json){
    var temp= json['Attendances'] as List<Map<String,dynamic>>;
    return Course(json['title'], temp.map((e) => Attendance.fromJson(e)).toList() );
  }
  Map<String ,dynamic> toJson(){
    return {
      'title':title,
      'Attendances':attendances.map((e) => e.toJson()).toList(),
    };
  }
}