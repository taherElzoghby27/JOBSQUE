// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  int? id;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;
  UserData({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
  });
  factory UserData.fromJson(json) => UserData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );
}
