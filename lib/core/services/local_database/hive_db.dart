import 'package:hive_flutter/hive_flutter.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/job_model.dart';

class HiveDb {
  //init hive
  static init() async {
    await Hive.initFlutter();
    // Register Adapter
    Hive.registerAdapter(JobAdapter());
    //open Job box
    await Hive.openBox<Job>(StringsEn.savedJobsBox);
  }
}
