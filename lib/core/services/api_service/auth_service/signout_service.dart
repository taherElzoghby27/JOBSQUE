import 'package:jobsque/core/helper/cache_helper.dart';

class SignOutService {
  //signOut
  Future<bool> signOut() async {
    return await CacheHelper.clearData();
  }
}
