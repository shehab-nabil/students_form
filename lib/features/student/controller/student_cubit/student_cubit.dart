import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task/features/student/controller/student_cubit/student_statee.dart';
import 'package:task/features/student/model/entities/student_model.dart';
import 'package:task/utils/app_strings.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());
  List<StudentModel>? students = [];
  readStudents() {
    var studentBox = Hive.box<StudentModel>(AppStrings.studentBox);
    students = studentBox.values.toList();
    emit(StudentSuccessState());
  }
}
