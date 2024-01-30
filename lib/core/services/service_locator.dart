import 'package:get_it/get_it.dart';
import 'package:jobsque/core/services/api_service/apply_user_service/apply_user_service.dart';
import 'package:jobsque/core/services/api_service/auth_service/login_auth_service.dart';
import 'package:jobsque/core/services/api_service/auth_service/register_auth_service.dart';
import 'package:jobsque/core/services/api_service/auth_service/reset_pass_auth_service.dart';
import 'package:jobsque/core/services/api_service/auth_service/signout_service.dart';
import 'package:jobsque/core/services/api_service/login_and_security_service/change_name_pass_service.dart';
import 'package:jobsque/core/services/api_service/login_and_security_service/get_otp_service.dart';
import 'package:jobsque/core/services/api_service/service/get_api_service.dart';
import 'package:jobsque/core/services/api_service/jop_service/filter_job_service.dart';
import 'package:jobsque/core/services/api_service/service/post_api_service.dart';
import 'package:jobsque/core/services/api_service/profile_service/add_portfolio_service.dart';
import 'package:jobsque/core/services/api_service/profile_service/edit_profile_service.dart';
import 'package:jobsque/core/services/api_service/get_service.dart';
import 'package:jobsque/core/services/api_service/service/put_api_service.dart';
import 'package:jobsque/core/services/local_database/hive_db_apply_user.dart';
import 'package:jobsque/core/services/local_database/hive_db_job.dart';
import 'package:jobsque/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:jobsque/features/job_detail/data/repo/apply_job_repo_implementation.dart';
import 'package:jobsque/features/notification/data/repos/notification_repo_implementation.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo_implementation.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/data/repo/login_security_repo_implementation.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/repo/portfolio_repo_implementation.dart';

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
  //get api service
  getIt.registerSingleton<GetApiService>(GetApiService());
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
  //get profile service
  getIt.registerSingleton<GetService>(
    GetService(
      getApiService: getIt.get<GetApiService>(),
    ),
  );
  //profile Repo Implementation
  getIt.registerSingleton<ProfileRepoImplementation>(
    ProfileRepoImplementation(
      signOutService: getIt.get<SignOutService>(),
      getProfileService: getIt.get<GetService>(),
    ),
  );
  //add portfolio api service
  getIt.registerSingleton<AddPortfolioService>(AddPortfolioService());
  //portfolio repo impl
  getIt.registerSingleton<PortfolioRepoImplementation>(
    PortfolioRepoImplementation(
      getProfileService: getIt.get<GetService>(),
      addPortfolioService: getIt.get<AddPortfolioService>(),
    ),
  );
  //notification repo implementation
  getIt.registerSingleton<NotificationRepoImplementation>(
    NotificationRepoImplementation(
      getService: getIt.get<GetService>(),
    ),
  );
  //get Otp service
  getIt.registerSingleton<GetOtpService>(
    GetOtpService(postApiService: getIt.get<PostApiService>()),
  );
  //update name Pass service
  getIt.registerSingleton<UpdateNamePassService>(
    UpdateNamePassService(postApiService: getIt.get<PostApiService>()),
  );
  //login and security repo impl
  getIt.registerSingleton<LoginAndSecurityRepoImplementation>(
    LoginAndSecurityRepoImplementation(
      getOtpService: getIt.get<GetOtpService>(),
      updateNamePassService: getIt.get<UpdateNamePassService>(),
    ),
  );
}
