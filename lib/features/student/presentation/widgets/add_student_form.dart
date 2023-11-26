import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/add_student_cubit/add_student_cubit.dart';
import '../../model/entities/student_model.dart';
import 'custom_buttom.dart';
import 'custom_form_text_field.dart';
import '../../../../generated/l10n.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/core.dart';

class AddStudentForm extends StatefulWidget {
  const AddStudentForm({
    super.key,
  });

  @override
  State<AddStudentForm> createState() => _AddStudentFormState();
}

class _AddStudentFormState extends State<AddStudentForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, address, phone, birthdate, remarks;
  String dropdownValue = AppStrings.classA;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomFormTextField(
              onSaved: (value) {
                name = value;
              },
              textInputType: TextInputType.name,
              hintText: S.of(context).studentName,
              validator: (data) {
                if (data?.isEmpty ?? true) {
                  return S.of(context).validationMessage;
                } else {
                  return null;
                }
              },
              borderRadius: 20),
          const SizedBox(
            height: 18,
          ),
          CustomFormTextField(
            onSaved: (value) {
              address = value;
            },
            hintText: S.of(context).address,
            borderRadius: 20,
            textInputType: TextInputType.streetAddress,
            validator: (data) {
              if (data?.isEmpty ?? true) {
                return S.of(context).validationMessage;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 18,
          ),
          CustomFormTextField(
            onSaved: (value) {
              phone = value;
            },
            prefix: Padding(
              padding: const EdgeInsets.only(top: 15, left: 17),
              child: Text('${Core.generateCountryFlag()} +20    '),
            ),
            hintText: S.of(context).phone,
            borderRadius: 20,
            textInputType: TextInputType.phone,
            validator: (data) {
              if (data?.isEmpty ?? true) {
                return S.of(context).validationMessage;
              } else if (data!.length < 10) {
                return S.of(context).shortnum;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 18,
          ),
          CustomFormTextField(
            onSaved: (value) {
              birthdate = value;
            },
            hintText: S.of(context).birthdate,
            borderRadius: 20,
            textInputType: TextInputType.datetime,
            validator: (data) {
              if (data?.isEmpty ?? true) {
                return S.of(context).validationMessage;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 18,
          ),
          DropdownButton(
            value: dropdownValue,
            items: [
              DropdownMenuItem(
                  value: AppStrings.classA, child: Text(S.of(context).classA)),
              DropdownMenuItem(
                  value: AppStrings.classB, child: Text(S.of(context).classB)),
              DropdownMenuItem(
                  value: AppStrings.classC, child: Text(S.of(context).classC)),
              DropdownMenuItem(
                  value: AppStrings.classD, child: Text(S.of(context).classD)),
            ],
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
          ),
          const SizedBox(
            height: 18,
          ),
          CustomFormTextField(
            onSaved: (value) {
              remarks = value;
            },
            hintText: S.of(context).remarks,
            maxLines: 8,
            borderRadius: 20,
            textInputType: TextInputType.text,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomCircularButtom(
            width: MediaQuery.of(context).size.width,
            height: 55,
            label: S.of(context).add,
            backgroundColor: AppColor.primaryColor,
            fontColor: Colors.black,
            radius: 15,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
              StudentModel student = StudentModel(
                  name: name!,
                  phone: phone!,
                  birthDate: birthdate!,
                  address: address!,
                  classChar: dropdownValue,
                  remarks: remarks!);
              BlocProvider.of<AddStudentCubit>(context).addStudent(student);
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
