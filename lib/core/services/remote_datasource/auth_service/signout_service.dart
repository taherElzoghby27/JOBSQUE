import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/services/local_datasource/hive_db_apply_user.dart';

class SignOutService {
  //signOut
  Future<bool> signOut() async {
    await HiveDbApplyUser().clear();
    return await CacheHelper.clearData();
  }
}
