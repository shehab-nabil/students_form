import 'package:flutter/material.dart';

import '../../model/entities/student_model.dart';
import 'custom_buttom.dart';
import 'custom_form_text_field.dart';
import '../../../../generated/l10n.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/core.dart';

class EditStudentForm extends StatefulWidget {
  const EditStudentForm({
    super.key,
    required this.studentModel,
  });
  final StudentModel studentModel;

  @override
  State<EditStudentForm> createState() => _AddStudentFormState();
}

class _AddStudentFormState extends State<EditStudentForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, address, phone, birthdate, remarks;

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
              initialValue: widget.studentModel.name,
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
            initialValue: widget.studentModel.address,
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
            initialValue: widget.studentModel.phone,
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
            initialValue: widget.studentModel.birthDate,
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
            value: widget.studentModel.classChar,
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
                widget.studentModel.classChar = value!;
              });
            },
          ),
          const SizedBox(
            height: 18,
          ),
          CustomFormTextField(
            initialValue: widget.studentModel.remarks,
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
            width: MediaQuery.of(context).size.width / 2,
            height: 55,
            label: S.of(context).edit,
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
              widget.studentModel.name = name ?? widget.studentModel.name;
              widget.studentModel.address =
                  address ?? widget.studentModel.address;
              widget.studentModel.phone = phone ?? widget.studentModel.phone;
              widget.studentModel.birthDate =
                  birthdate ?? widget.studentModel.birthDate;
              widget.studentModel.address =
                  address ?? widget.studentModel.address;

              widget.studentModel.save();
              Navigator.pop(context);
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
