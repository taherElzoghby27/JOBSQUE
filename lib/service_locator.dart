import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jobsque/core/services/local_datasource/hive_db_job.dart';
import 'package:jobsque/core/services/remote_datasource/auth_service/register_auth_service.dart';
import 'package:jobsque/core/services/remote_datasource/jop_service/filter_job_service.dart';
import 'package:jobsque/core/services/remote_datasource/login_and_security_service/get_otp_service.dart';
import 'package:jobsque/features/applied/data/repo/applied_job_repo_implementation.dart';
import 'package:jobsque/features/auth/data/repos/auth_repo.dart';
import 'package:jobsque/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:jobsque/features/complete_profile/data/repo/complete_profile_repo_impl.dart';
import 'package:jobsque/features/home/data/repo/home_repo.dart';
import 'package:jobsque/features/job_detail/data/repo/apply_job_repo.dart';
import 'package:jobsque/features/job_detail/data/repo/apply_job_repo_implementation.dart';
import 'package:jobsque/features/notification/data/repos/notification_repo.dart';
import 'package:jobsque/features/notification/data/repos/notification_repo_implementation.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo_implementation.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/data/repo/login_security_repo.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/data/repo/login_security_repo_implementation.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/repo/portfolio_repo.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/repo/portfolio_repo_implementation.dart';

import 'features/applied/data/repo/applied_job_repo.dart';
import 'features/complete_profile/data/repo/complete_profile_repo.dart';
import 'features/home/data/repo/home_repo_implementation.dart';
import 'core/consts/api_service.dart';
import 'core/services/local_datasource/hive_db_apply_user.dart';
import 'core/services/remote_datasource/apply_user_service/apply_user_service.dart';
import 'core/services/remote_datasource/auth_service/login_auth_service.dart';
import 'core/services/remote_datasource/auth_service/reset_pass_auth_service.dart';
import 'core/services/remote_datasource/auth_service/signout_service.dart';
import 'core/services/remote_datasource/login_and_security_service/change_name_pass_service.dart';
import 'core/services/remote_datasource/profile_service/add_experience_service.dart';
import 'core/services/remote_datasource/profile_service/add_portfolio_service.dart';
import 'core/services/remote_datasource/profile_service/edit_profile_service.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  ///External
  initExternal();

  ///Core
  initService();

  ///Feautres
  //Repository
  initRepository();
}

initRepository() {
  //Auth repo implementation
  sl.registerLazySingleton<AuthRepoImplementation>(
    () => AuthRepoImplementation(
      registerApiService: sl.get<RegisterApiService>(),
      loginApiService: sl.get<LoginApiService>(),
      resetPassApiService: sl.get<ResetPassApiService>(),
    ),
  );
  //jobs repo implementation
  sl.registerLazySingleton<FilterJobsRepoImplementation>(
    () => FilterJobsRepoImplementation(
      jobApiService: sl.get<JobApiService>(),
    ),
  );
  //apply user repo implementation
  sl.registerLazySingleton<ApplyUserRepoImplementation>(
    () => ApplyUserRepoImplementation(
      applyUserService: sl.get<ApplyUserService>(),
    ),
  );
  //profile Repo Implementation
  sl.registerLazySingleton<ProfileRepoImplementation>(
    () => ProfileRepoImplementation(
      signOutService: sl.get<SignOutService>(),
      apiService: sl.get<ApiService>(),
      editProfileService: sl.get<EditProfileService>(),
    ),
  );
  //portfolio repo impl
  sl.registerLazySingleton<PortfolioRepoImplementation>(
    () => PortfolioRepoImplementation(
      apiService: sl.get<ApiService>(),
      addPortfolioService: sl.get<AddPortfolioService>(),
    ),
  );
  //notification repo implementation
  sl.registerLazySingleton<NotificationRepoImplementation>(
    () => NotificationRepoImplementation(
      apiService: sl.get<ApiService>(),
    ),
  );
  //login and security repo impl
  sl.registerLazySingleton<LoginAndSecurityRepoImplementation>(
    () => LoginAndSecurityRepoImplementation(
      getOtpService: sl.get<GetOtpService>(),
      updateNamePassService: sl.get<UpdateNamePassService>(),
    ),
  );

  //applied repo impl
  sl.registerLazySingleton<AppliedJobsRepoImplementation>(
    () => AppliedJobsRepoImplementation(
      apiService: sl.get<ApiService>(),
      hiveDbApplyUser: sl.get<HiveDbApplyUser>(),
    ),
  );
  //CompleteProfileRepoImpl
  sl.registerLazySingleton<CompleteProfileRepoImpl>(
    () => CompleteProfileRepoImpl(
      addExperienceService: sl.get<AddExperienceService>(),
    ),
  );
}

initService() {
  //hive db job
  sl.registerLazySingleton(() => HiveDbJob());
  //hive db Apply user
  sl.registerLazySingleton(() => HiveDbApplyUser());
  // api service
  sl.registerSingleton<ApiService>(
    ApiService(dio: sl.get<Dio>()),
  );
  //register api service
  sl.registerLazySingleton<RegisterApiService>(
    () => RegisterApiService(
      apiService: sl.get<ApiService>(),
    ),
  );
  //login api service
  sl.registerLazySingleton<LoginApiService>(
    () => LoginApiService(
      apiService: sl.get<ApiService>(),
    ),
  );

  //reset pass api service
  sl.registerLazySingleton<ResetPassApiService>(
    () => ResetPassApiService(
      apiService: sl.get<ApiService>(),
    ),
  );
  //edit profile service
  sl.registerLazySingleton(
    () => EditProfileService(
      apiService: sl.get<ApiService>(),
    ),
  );

  //job api service
  sl.registerLazySingleton(
    () => JobApiService(
      apiService: sl.get<ApiService>(),
    ),
  );

  //apply user service
  sl.registerLazySingleton(
    () => ApplyUserService(
      apiService: sl.get<ApiService>(),
    ),
  );

  //sign out service
  sl.registerLazySingleton(() => SignOutService());

  //add portfolio api service
  sl.registerLazySingleton(
    () => AddPortfolioService(
      apiService: sl.get<ApiService>(),
    ),
  );

  //get Otp service
  sl.registerLazySingleton(
    () => GetOtpService(
      apiService: sl.get<ApiService>(),
    ),
  );
  //update name Pass service
  sl.registerLazySingleton(
    () => UpdateNamePassService(
      apiService: sl.get<ApiService>(),
    ),
  );

  //addExperienceService
  sl.registerLazySingleton(
    () => AddExperienceService(
      apiService: sl.get<ApiService>(),
    ),
  );
}

initExternal() {
  sl.registerSingleton(Dio());
}
