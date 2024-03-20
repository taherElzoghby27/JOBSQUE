
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';

Job filterJob({
  required ApplyUser applyUser,
  required List<Job> jobs,
}) {
  List<Job> jobsList = jobs
      .where(
        (e) => e.id.toString() == applyUser.jobId,
      )
      .toList();
  return jobsList.first;
}

bool checkPhoneNumber({required String number, required String codeCountry}) =>
    '+$number'.startsWith(codeCountry) ? true : false;
