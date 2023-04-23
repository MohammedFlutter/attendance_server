
import 'package:attendance_server/domain/attendance.dart';

class Course {
  final String title ;

  final List<Attendance> Attendances;

  Course(this.title, [this.Attendances=const []]);
  factory Course.fromJson (Map<String, dynamic> json){
    var temp= json['Attendances'] as List<Map<String,dynamic>>;
    return Course(json['title'], temp.map((e) => Attendance.fromJson(e)).toList() );
  }
  Map<String ,dynamic> toJson(){
    return {
      'title':title,
      'Attendances':Attendances.map((e) => e.toJson()).toList(),
    };
  }
}