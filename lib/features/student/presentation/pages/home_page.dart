import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/student_cubit/Student_cubit.dart';
import '../../controller/student_cubit/student_statee.dart';
import '../widgets/add_student_bottom_sheet.dart';
import '../widgets/student_list.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/app_colors.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StudentCubit(),
      child: BlocBuilder<StudentCubit, StudentState>(
        builder: (BuildContext context, state) {
          BlocProvider.of<StudentCubit>(context).readStudents();
          return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).students),
              actions: [
                IconButton(
                    onPressed: () {
                      if (Intl.getCurrentLocale() == 'en') {
                        setState(() {
                          S.load(const Locale('ar'));
                        });
                      } else {
                        setState(() {
                          S.load(const Locale('en'));
                        });
                      }
                    },
                    icon: Icon(
                      Icons.translate,
                      color: AppColor.darkGrey,
                    ))
              ],
            ),
            body: const StudentList(),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    context: context,
                    builder: (context) {
                      return const AddBottomSheet();
                    },
                  );
                },
                backgroundColor: AppColor.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Icon(
                  Icons.add,
                  color: AppColor.primaryColor,
                )),
          );
        },
      ),
    );
  }
}
