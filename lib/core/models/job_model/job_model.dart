import 'package:hive/hive.dart';

part 'job_model.g.dart';

@HiveType(typeId: 0)
class Job extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? jobTimeType;
  @HiveField(4)
  String? jobType;
  @HiveField(5)
  String? jobLevel;
  @HiveField(6)
  String? jobDescription;
  @HiveField(7)
  String? jobSkill;
  @HiveField(8)
  String? compName;
  @HiveField(9)
  String? compEmail;
  @HiveField(10)
  String? compWebsite;
  @HiveField(11)
  String? aboutComp;
  @HiveField(12)
  String? location;
  @HiveField(13)
  String? salary;
  @HiveField(14)
  int? favorites;
  @HiveField(15)
  int? expired;
  @HiveField(16)
  String? createdAt;
  @HiveField(17)
  String? updatedAt;

  Job({
    this.id,
    this.name,
    this.image,
    this.jobTimeType,
    this.jobType,
    this.jobLevel,
    this.jobDescription,
    this.jobSkill,
    this.compName,
    this.compEmail,
    this.compWebsite,
    this.aboutComp,
    this.location,
    this.salary,
    this.favorites,
    this.expired,
    this.createdAt,
    this.updatedAt,
  });

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    jobTimeType = json['job_time_type'];
    jobType = json['job_type'];
    jobLevel = json['job_level'];
    jobDescription = json['job_description'];
    jobSkill = json['job_skill'];
    compName = json['comp_name'];
    compEmail = json['comp_email'];
    compWebsite = json['comp_website'];
    aboutComp = json['about_comp'];
    location = json['location'];
    salary = json['salary'];
    favorites = json['favorites'];
    expired = json['expired'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['location'] = this.location;
    data['salary'] = this.salary;
    return data;
  }
}
