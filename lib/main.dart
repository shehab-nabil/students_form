import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/app.dart';
import 'package:task/features/student/model/entities/student_model.dart';
import 'package:task/utils/app_strings.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());
  await Hive.openBox<StudentModel>(AppStrings.studentBox);
  await Hive.openBox(AppStrings.localBox);
  runApp(const MyApp());
}
