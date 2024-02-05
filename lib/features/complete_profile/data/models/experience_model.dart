class ExperienceModel {
  String? userId;
  String? postion;
  String? typeWork;
  String? compName;
  String? location;
  String? start;
  String? updatedAt;
  String? createdAt;
  int? id;

  ExperienceModel({
    this.userId,
    this.postion,
    this.typeWork,
    this.compName,
    this.location,
    this.start,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  ExperienceModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    postion = json['postion'];
    typeWork = json['type_work'];
    compName = json['comp_name'];
    location = json['location'];
    start = json['start'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['postion'] = this.postion;
    data['type_work'] = this.typeWork;
    data['comp_name'] = this.compName;
    data['location'] = this.location;
    data['start'] = this.start;
    return data;
  }
}
