import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/add_student_cubit/add_student_cubit.dart';
import '../../model/entities/student_model.dart';
import 'edit_student_form.dart';

class EditBottomSheet extends StatelessWidget {
  const EditBottomSheet({super.key, required this.student});
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddStudentCubit(),
      child: BlocConsumer<AddStudentCubit, AddStudentState>(
        listener: (BuildContext context, AddStudentState state) {
          if (state is AddStudentFailurerState) {
            print(state.errorMessage);
          } else if (state is AddStudentSuccessState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AddStudentState state) {
          return Padding(
            padding: EdgeInsets.only(
                left: 16.0,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: EditStudentForm(
                studentModel: student,
              ),
            ),
          );
        },
      ),
    );
  }
}
