import 'dart:io';

import 'package:dio/dio.dart';

class PortfolioModel {
  String? name;
  String? cvFile;
  File? image;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  PortfolioModel({
    this.name,
    this.cvFile,
    this.image,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  PortfolioModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cvFile = json['cv_file'];
    image = File(json['image']);
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  toMap() async {
    FormData formData = FormData.fromMap({
      'cv_file': this.cvFile,
      'image': await MultipartFile.fromFile(
        this.image!.path,
        filename: this.image!.path.split('/').last,
      ),
    });

    return formData;
  }
}
