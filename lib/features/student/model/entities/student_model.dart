import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String phone;
  @HiveField(2)
  String birthDate;
  @HiveField(3)
  String address;
  @HiveField(4)
  String classChar;
  @HiveField(5)
  String remarks;
  StudentModel({
    required this.name,
    required this.phone,
    required this.birthDate,
    required this.address,
    required this.classChar,
    required this.remarks,
  });
}
