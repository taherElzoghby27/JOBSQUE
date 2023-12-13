import 'package:hive_flutter/hive_flutter.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';

import '../../consts/strings.dart';

class HiveDbApplyUser {
  Box<ApplyUser> savedJobBox = Hive.box<ApplyUser>(StringsEn.userApplyBox);

  //init hive
  static init() async {
    await Hive.initFlutter();
    // Register Adapter
    Hive.registerAdapter(ApplyUserAdapter());
    //open user apply box
    await Hive.openBox<ApplyUser>(StringsEn.userApplyBox);
  }

//add apply user
  add({required ApplyUser user}) {}

//update user
  update({required ApplyUser user}) {}

//get users apply
  get() {}
}
