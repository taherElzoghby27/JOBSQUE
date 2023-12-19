// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:jobsque/core/consts/strings.dart';

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
  @HiveField(9)
  final bool reviewed;
  @HiveField(10)
  final String updatedAt;
  @HiveField(11)
  final String createdAt;
  @HiveField(12)
  final int id;

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
    required this.reviewed,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  factory ApplyUser.fromJson(Map<String, dynamic> json) => ApplyUser(
        name: json['name'],
        email: json['email'],
        phone: json['mobile'],
        typeOfWork: json['work_type'],
        cv: json['cv_file'],
        otherFiles: json['other_file'],
        userId: json['user_id'],
        jobId: json['jobs_id'],
        reviewed: json['reviewed'],
        updatedAt: json['updated_at'],
        createdAt: json['created_at'],
        id: json['id'],
        status: StringsEn.completed,
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.phone;
    data['work_type'] = this.typeOfWork;
    data['cv_file'] = this.cv;
    data['other_file'] = this.otherFiles;
    data['jobs_id'] = this.jobId;
    data['user_id'] = this.userId;
    return data;
  }
}
