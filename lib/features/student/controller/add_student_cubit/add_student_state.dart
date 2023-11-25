part of 'add_student_cubit.dart';

abstract class AddStudentState extends Equatable {
  const AddStudentState();

  @override
  List<Object> get props => [];
}

class AddStudentInitial extends AddStudentState {}

class AddStudentloadingState extends AddStudentState {}

class AddStudentSuccessState extends AddStudentState {}

class AddStudentFailurerState extends AddStudentState {
  final String errorMessage;

  const AddStudentFailurerState(this.errorMessage);
}
