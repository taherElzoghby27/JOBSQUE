import 'dart:io';

class PortfolioCv {
  String? name;
  File? cvFile;
  File? image;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  PortfolioCv({
    this.name,
    this.cvFile,
    this.image,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  PortfolioCv.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cvFile = File(json['cv_file']);
    image = File(json['image']);
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cv_file'] = this.cvFile;
    data['image'] = this.image;
    return data;
  }
}
