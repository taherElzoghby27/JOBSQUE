// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  @HiveField(6)
  final String userId;
  @HiveField(7)
  final String jobId;
  @HiveField(8)
  final String status;

  ApplyUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.typeOfWork,
    required this.cv,
    required this.otherFiles,
    required this.userId,
    required this.jobId,
    required this.status,
  });
}
