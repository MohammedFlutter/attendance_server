import 'package:attendance_server/domain/course.dart';
import 'package:attendance_server/domain/teacher.dart';
import 'package:flutter/material.dart';

class TeacherProvider extends ChangeNotifier{
   Teacher? _teacher;

   TeacherProvider() {
     _teacher = Teacher('', []);
   }

   setName(String name ){
    _teacher =Teacher(name);
    notifyListeners();
  }



   Teacher get teacher => _teacher!;

   addCourse(String courseTitle){
    _teacher?.courses.add(Course(courseTitle));
    notifyListeners();
  }


}