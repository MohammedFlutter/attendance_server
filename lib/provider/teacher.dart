import 'package:attendance_server/domain/teacher.dart';
import 'package:flutter/material.dart';

class TeacherProvider extends ChangeNotifier{
  Teacher? teacher;
  setName(String name ){
    teacher =Teacher(name);
    notifyListeners();
  }

}