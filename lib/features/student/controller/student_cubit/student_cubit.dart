import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'student_statee.dart';
import '../../model/entities/student_model.dart';
import '../../../../utils/app_strings.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());
  List<StudentModel>? students = [];
  readStudents() {
    var studentBox = Hive.box<StudentModel>(AppStrings.studentBox);
    students = studentBox.values.toList();
    emit(StudentSuccessState());
  }
}
