import 'package:hive_flutter/hive_flutter.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';

import '../../consts/strings.dart';

class HiveDbApplyUser {
  List<ApplyUser> applyUsersList = [];
  Box<ApplyUser> applyUsers = Hive.box<ApplyUser>(StringsEn.userApplyBox);

  //init hive
  static init() async {
    await Hive.initFlutter();
    // Register Adapter
    Hive.registerAdapter(ApplyUserAdapter());
    //open user apply box
    await Hive.openBox<ApplyUser>(StringsEn.userApplyBox);
  }

//add apply user
  add({required ApplyUser user}) => applyUsers.put(user.jobId, user);

//get users apply
  get() {
    List<ApplyUser> appUsers = List<ApplyUser>.from(
      (applyUsers.values).map((user) => user),
    ).toList();
    applyUsersList = appUsers;
  }

//dispose
  void dispose() async {
    await Hive.box(StringsEn.userApplyBox).close();
    await Hive.close();
    print('Apply user box is closed.....!');
  }

//clear box
  clear() {
    applyUsers.clear();
    get();
  }
}
