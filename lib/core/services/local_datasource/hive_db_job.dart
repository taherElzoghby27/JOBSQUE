import 'package:hive_flutter/hive_flutter.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';

class HiveDbJob {
  List<Job> savedJobsList = [];
  Box<Job> savedJobBox = Hive.box<Job>(StringsEn.savedJobsBox);

  //init hive
  static init() async {
    await Hive.initFlutter();
    // Register Adapter
    Hive.registerAdapter(JobAdapter());
    //open Job box
    await Hive.openBox<Job>(StringsEn.savedJobsBox);
  }

//add job to saved job
  add({required Job job}) {
    savedJobBox.put(job.id as int, job);
  }

//delete saved job
  delete({required Job job}) {
    savedJobBox.delete(job.id as int);
    get();
  }

//get all saved jobs
  get() {
    List<Job> savedJobs = List<Job>.from(
      (savedJobBox.values).map((job) => job),
    ).toList();
    savedJobsList = savedJobs;
  }

  //check saved or not
  bool checkSavedOrNot({required Job job}) =>
      savedJobBox.containsKey(job.id as int);
}
