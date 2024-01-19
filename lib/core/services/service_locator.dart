import 'package:get_it/get_it.dart';
import 'package:jobsque/core/services/api_service/apply_user_service/apply_user_service.dart';
import 'package:jobsque/core/services/api_service/auth_service/login_auth_service.dart';
import 'package:jobsque/core/services/api_service/auth_service/register_auth_service.dart';
import 'package:jobsque/core/services/api_service/auth_service/reset_pass_auth_service.dart';
import 'package:jobsque/core/services/api_service/auth_service/signout_service.dart';
import 'package:jobsque/core/services/api_service/jop_service/filter_job_service.dart';
import 'package:jobsque/core/services/api_service/post_api_service.dart';
import 'package:jobsque/core/services/api_service/profile_service/edit_profile_service.dart';
import 'package:jobsque/core/services/api_service/put_api_service.dart';
import 'package:jobsque/core/services/local_database/hive_db_apply_user.dart';
import 'package:jobsque/core/services/local_database/hive_db_job.dart';
import 'package:jobsque/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:jobsque/features/job_detail/data/repo/apply_job_repo_implementation.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo_implementation.dart';

import '../../features/home/data/repo/home_repo_implementation.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //hive db job
  getIt.registerSingleton<HiveDbJob>(HiveDbJob());
  //hive db Apply user
  getIt.registerSingleton<HiveDbApplyUser>(HiveDbApplyUser());
  //post api service
  getIt.registerSingleton<PostApiService>(PostApiService());
  //put api service
  getIt.registerSingleton<PutApiService>(PutApiService());
  //register api service
  getIt.registerSingleton<RegisterApiService>(
    RegisterApiService(
      postApiService: getIt.get<PostApiService>(),
    ),
  );
  //login api service
  getIt.registerSingleton<LoginApiService>(
    LoginApiService(
      postApiService: getIt.get<PostApiService>(),
    ),
  );
  //resetpass api service
  getIt.registerSingleton<ResetPassApiService>(
    ResetPassApiService(
      postApiService: getIt.get<PostApiService>(),
    ),
  );
  //edit profile service
  getIt.registerSingleton<EditProfileService>(
    EditProfileService(
      putApiService: getIt.get<PutApiService>(),
    ),
  );
  //Auth repo implementation
  getIt.registerSingleton<AuthRepoImplementation>(
    AuthRepoImplementation(
      registerApiService: getIt.get<RegisterApiService>(),
      loginApiService: getIt.get<LoginApiService>(),
      resetPassApiService: getIt.get<ResetPassApiService>(),
      editProfileService: getIt.get<EditProfileService>(),
    ),
  );
  //job api service
  getIt.registerSingleton<JobApiService>(
    JobApiService(postApiService: getIt.get<PostApiService>()),
  );
  //jobs repo implementation
  getIt.registerSingleton<FilterJobsRepoImplementation>(
    FilterJobsRepoImplementation(
      jobApiService: getIt.get<JobApiService>(),
    ),
  );
  //apply user service
  getIt.registerSingleton<ApplyUserService>(ApplyUserService());
  //apply user repo implementation
  getIt.registerSingleton<ApplyUserRepoImplementation>(
    ApplyUserRepoImplementation(
      applyUserService: getIt.get<ApplyUserService>(),
    ),
  );
  //sign out service
  getIt.registerSingleton<SignOutService>(SignOutService());
  //profile Repo Implementation
  getIt.registerSingleton<ProfileRepoImplementation>(
    ProfileRepoImplementation(
      signOutService: getIt.get<SignOutService>(),
    ),
  );
}
