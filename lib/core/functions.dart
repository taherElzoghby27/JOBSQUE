//filterJob
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';

List<Job> filterJob({
  required ApplyUser applyUser,
  required List<Job> jobs,
}) =>
    jobs
        .where(
          (e) => e.id.toString() == applyUser.jobId,
    )
        .toList();