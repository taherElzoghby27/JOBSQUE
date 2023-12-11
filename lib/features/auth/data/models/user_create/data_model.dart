class Data {
  dynamic name;
  dynamic email;
  dynamic password;
  int? otp;
  dynamic updatedAt;
  dynamic createdAt;
  int? id;

  Data({
    this.name,
    this.email,
    this.password,
    this.otp,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    otp = json['otp'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJsonRigester() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }

  Map<String, dynamic> toJsonLogin() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
