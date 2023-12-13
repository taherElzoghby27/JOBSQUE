
import 'package:hive/hive.dart';
part 'apply_user_model.g.dart';
@HiveType(typeId: 1)
class ApplyUser extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String phone;
  @HiveField(3)
  final String typeOfWork;
  @HiveField(4)
  final String cv;
  @HiveField(5)
  final String otherFiles;

  ApplyUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.typeOfWork,
    required this.cv,
    required this.otherFiles,
  });
}
