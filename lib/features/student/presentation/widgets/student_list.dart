import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/student_cubit/Student_cubit.dart';
import '../../controller/student_cubit/student_statee.dart';
import '../../model/entities/student_model.dart';
import 'custom_form_text_field.dart';
import 'student_item.dart';
import '../../../../generated/l10n.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  void initState() {
    BlocProvider.of<StudentCubit>(context).readStudents();
    super.initState();
  }

  String _text = '';
  bool _containsSearchText(StudentModel student) {
    final name = student.name;
    final textLower = _text.toLowerCase();
    final studentLower = name.toLowerCase();
    return studentLower.contains(textLower);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      builder: (BuildContext context, state) {
        List<StudentModel> allStudents =
            BlocProvider.of<StudentCubit>(context).students!;
        List<StudentModel> searchedStudents =
            allStudents.where(_containsSearchText).toList();
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 35, right: 20, left: 20, bottom: 15),
              child: CustomFormTextField(
                borderRadius: 5,
                prefix: const Icon(Icons.search),
                hintText: S.of(context).search,
                onChange: (value) {
                  setState(() {
                    _text = value;
                  });
                },
                textInputType: TextInputType.name,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ListView.builder(
                  itemCount: searchedStudents.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: StudentItem(student: searchedStudents[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
