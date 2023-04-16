
import 'package:attendance_server/domain/attendance.dart';

class Subject {
  final String title ;

  final List<Attendance> Attendances;

  Subject._(this.title, this.Attendances);
  factory Subject (Map<String, dynamic> json){
    var temp= json['Attendances'] as List<Map<String,dynamic>>;
    return Subject._(json['title'], temp.map((e) => Attendance.fromJson(e)).toList() );
  }
  Map<String ,dynamic> toJson(){
    return {
      'title':title,
      'Attendances':Attendances.map((e) => e.toJson()).toList(),
    };
  }
}