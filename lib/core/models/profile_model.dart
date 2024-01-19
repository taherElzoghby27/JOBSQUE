class ProfileModel {
  String bio;
  String address;
  String mobile;
  String language;
  String interestedWork;
  String offlinePlace;
  String remotePlace;
  String experience;
  String personalDetailed;
  String education;

  ProfileModel({
    this.bio = '',
    this.address = '',
    this.mobile = '',
    this.language = '',
    this.interestedWork = '',
    this.offlinePlace = '',
    this.remotePlace = '',
    this.experience = '',
    this.personalDetailed = '',
    this.education = '',
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        bio: json['bio'],
        address: json['address'],
        mobile: json['mobile'],
        language: json['language'],
        interestedWork: json['interested_work'],
        offlinePlace: json['offline_place'],
        remotePlace: json['remote_place'],
        experience: json['experience'],
        personalDetailed: json['personal_detailed'],
        education: json['education'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bio'] = this.bio;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['language'] = this.language;
    data['interested_work'] = this.interestedWork;
    data['offline_place'] = this.offlinePlace;
    data['remote_place'] = this.remotePlace;
    data['experience'] = this.experience;
    data['personal_detailed'] = this.personalDetailed;
    data['education'] = this.education;
    return data;
  }
}
