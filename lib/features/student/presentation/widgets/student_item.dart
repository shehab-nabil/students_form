import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/student/controller/student_cubit/Student_cubit.dart';
import 'package:task/features/student/model/entities/student_model.dart';
import 'package:task/features/student/presentation/widgets/edit_student_bottom_sheet.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/utils/app_colors.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({
    super.key,
    required this.student,
  });
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          context: context,
          builder: (context) {
            return EditBottomSheet(
              student: student,
            );
          },
        );
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColor.primaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                student.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(
                  top: 6,
                  bottom: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${S.of(context).address} : ${student.address}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '${S.of(context).phone} : ${student.phone}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "${S.of(context).birthdate} : ${student.birthDate}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '${S.of(context).classChar} : ${student.classChar}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      student.remarks,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    student.delete();
                    BlocProvider.of<StudentCubit>(context).readStudents();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: AppColor.black,
                    size: 30,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
