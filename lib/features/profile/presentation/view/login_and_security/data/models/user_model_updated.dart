class UserModelUpdated {
  int? id;
  String? name;
  String? otp;
  dynamic towStep;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserModelUpdated({
    this.id,
    this.name,
    this.otp,
    this.towStep,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  UserModelUpdated.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    otp = json['otp'];
    towStep = json['tow_step'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
