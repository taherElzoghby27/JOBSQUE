import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jobsque/core/network_info/network_info.dart';
import 'package:jobsque/core/services/local_datasource/hive_db_job.dart';
import 'package:jobsque/core/services/remote_datasource/auth_service/register_auth_service.dart';
import 'package:jobsque/core/services/remote_datasource/jop_service/filter_job_service.dart';
import 'package:jobsque/core/services/remote_datasource/login_and_security_service/get_otp_service.dart';
import 'package:jobsque/core/services/remote_datasource/profile_service/delete_portfolio_service.dart';
import 'package:jobsque/features/applied/data/repo/applied_job_repo_implementation.dart';
import 'package:jobsque/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:jobsque/features/complete_profile/data/repo/complete_profile_repo_impl.dart';
import 'package:jobsque/features/job_detail/data/repo/apply_job_repo_implementation.dart';
import 'package:jobsque/features/notification/data/repos/notification_repo_implementation.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo_implementation.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/data/repo/edit_profile_repo_impl.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/data/repo/login_security_repo_implementation.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/repo/portfolio_repo_implementation.dart';
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

final getIt = GetIt.instance;

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
  getIt.registerLazySingleton<AuthRepoImplementation>(
    () => AuthRepoImplementation(
      registerApiService: getIt.get<RegisterApiService>(),
      loginApiService: getIt.get<LoginApiService>(),
      resetPassApiService: getIt.get<ResetPassApiService>(),
    ),
  );
  //jobs repo implementation
  getIt.registerLazySingleton<FilterJobsRepoImplementation>(
    () => FilterJobsRepoImplementation(
      jobApiService: getIt.get<JobApiService>(),
    ),
  );
  //apply user repo implementation
  getIt.registerLazySingleton<ApplyUserRepoImplementation>(
    () => ApplyUserRepoImplementation(
      applyUserService: getIt.get<ApplyUserService>(),
      hiveDbApplyUser: getIt.get<HiveDbApplyUser>(),
      networkInfo: getIt.get<NetworkInfoImpl>(),
    ),
  );
  //profile Repo Implementation
  getIt.registerLazySingleton<ProfileRepoImplementation>(
    () => ProfileRepoImplementation(
      signOutService: getIt.get<SignOutService>(),
      apiService: getIt.get<ApiService>(),
    ),
  );
  //edit profile Repo Implementation
  getIt.registerLazySingleton<EditProfileRepoImpl>(
    () => EditProfileRepoImpl(
      editProfileService: getIt.get<EditProfileService>(),
    ),
  );
  //portfolio repo impl
  getIt.registerLazySingleton<PortfolioRepoImplementation>(
    () => PortfolioRepoImplementation(
      addPortfolioService: getIt.get<AddPortfolioService>(),
      deletePortfolioService: getIt.get<DeletePortfolioService>(),
    ),
  );
  //notification repo implementation
  getIt.registerLazySingleton<NotificationRepoImplementation>(
    () => NotificationRepoImplementation(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //login and security repo impl
  getIt.registerLazySingleton<LoginAndSecurityRepoImplementation>(
    () => LoginAndSecurityRepoImplementation(
      getOtpService: getIt.get<GetOtpService>(),
      updateNamePassService: getIt.get<UpdateNamePassService>(),
    ),
  );

  //applied repo impl
  getIt.registerLazySingleton<AppliedJobsRepoImplementation>(
    () => AppliedJobsRepoImplementation(
      apiService: getIt.get<ApiService>(),
      hiveDbApplyUser: getIt.get<HiveDbApplyUser>(),
    ),
  );
  //CompleteProfileRepoImpl
  getIt.registerLazySingleton<CompleteProfileRepoImpl>(
    () => CompleteProfileRepoImpl(
      addExperienceService: getIt.get<AddExperienceService>(),
    ),
  );
}

initService() {
  //hive db job
  getIt.registerLazySingleton(() => HiveDbJob());
  //hive db Apply user
  getIt.registerLazySingleton(() => HiveDbApplyUser());
  //network info
  getIt.registerSingleton<NetworkInfoImpl>(
    NetworkInfoImpl(
      getIt.get<InternetConnectionChecker>(),
    ),
  );
  // api service
  getIt.registerSingleton<ApiService>(
    ApiService(dio: getIt.get<Dio>()),
  );
  //register api service
  getIt.registerLazySingleton<RegisterApiService>(
    () => RegisterApiService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //login api service
  getIt.registerLazySingleton<LoginApiService>(
    () => LoginApiService(
      apiService: getIt.get<ApiService>(),
    ),
  );

  //reset pass api service
  getIt.registerLazySingleton<ResetPassApiService>(
    () => ResetPassApiService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //edit profile service
  getIt.registerLazySingleton(
    () => EditProfileService(
      apiService: getIt.get<ApiService>(),
    ),
  );

  //job api service
  getIt.registerLazySingleton(
    () => JobApiService(
      apiService: getIt.get<ApiService>(),
    ),
  );

  //apply user service
  getIt.registerLazySingleton(
    () => ApplyUserService(
      apiService: getIt.get<ApiService>(),
    ),
  );

  //sign out service
  getIt.registerLazySingleton(() => SignOutService());

  //add portfolio api service
  getIt.registerLazySingleton(
    () => AddPortfolioService(
      apiService: getIt.get<ApiService>(),
    ),
  );

  //get Otp service
  getIt.registerLazySingleton(
    () => GetOtpService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //update name Pass service
  getIt.registerLazySingleton(
    () => UpdateNamePassService(
      apiService: getIt.get<ApiService>(),
    ),
  );

  //addExperienceService
  getIt.registerLazySingleton(
    () => AddExperienceService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //delete portfolio service
  getIt.registerLazySingleton(
    () => DeletePortfolioService(
      apiService: getIt.get<ApiService>(),
    ),
  );
}

initExternal() {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(InternetConnectionChecker());
}
