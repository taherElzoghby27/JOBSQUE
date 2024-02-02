import 'package:jobsque/core/helper/cache_helper.dart';

import '../../local_database/hive_db_apply_user.dart';

class SignOutService {
  //signOut
  Future<bool> signOut() async {
    await HiveDbApplyUser().clear();
    return await CacheHelper.clearData();
  }
}
