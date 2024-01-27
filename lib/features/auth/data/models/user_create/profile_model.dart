class ProfileUser {
  int? userId;
  dynamic name;
  dynamic email;
  dynamic updatedAt;
  dynamic createdAt;
  int? id;

  ProfileUser({
    this.userId,
    this.name,
    this.email,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  ProfileUser.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
