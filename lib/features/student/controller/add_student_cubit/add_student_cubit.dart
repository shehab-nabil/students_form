import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:task/features/student/model/entities/student_model.dart';
import 'package:task/utils/app_strings.dart';

part 'add_student_state.dart';

class AddStudentCubit extends Cubit<AddStudentState> {
  AddStudentCubit() : super(AddStudentInitial());
  addStudent(StudentModel student) async {
    emit(AddStudentloadingState());
    try {
      var studentBox = Hive.box<StudentModel>(AppStrings.studentBox);
      await studentBox.add(student);
      emit(AddStudentSuccessState());
    } catch (error) {
      emit(AddStudentFailurerState(error.toString()));
    }
  }
}
