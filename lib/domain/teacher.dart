import 'package:attendance_server/domain/course.dart';

class Teacher{
  final String name ;

  final List<Course> courses;

  Teacher._(this.name, this.courses);
  factory Teacher (Map<String, dynamic> json){
    var temp= json['courses'] as List<Map<String,dynamic>>;
    return Teacher._(json['name'], temp.map((e) => Course.fromJson(e)).toList() );
  }
  Map<String ,dynamic> toJson(){
    return {
      'name':name,
      'courses':courses.map((e) => e.toJson()).toList(),
    };
  }
}