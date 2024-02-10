import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jobsque/core/services/local_datasource/hive_db_job.dart';
import 'package:jobsque/core/services/remote_datasource/auth_service/register_auth_service.dart';
import 'package:jobsque/core/services/remote_datasource/jop_service/filter_job_service.dart';
import 'package:jobsque/core/services/remote_datasource/login_and_security_service/get_otp_service.dart';
import 'package:jobsque/features/applied/data/repo/applied_job_repo_implementation.dart';
import 'package:jobsque/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:jobsque/features/complete_profile/data/repo/complete_profile_repo_impl.dart';
import 'package:jobsque/features/job_detail/data/repo/apply_job_repo_implementation.dart';
import 'package:jobsque/features/notification/data/repos/notification_repo_implementation.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo_implementation.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/data/repo/login_security_repo_implementation.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/repo/portfolio_repo_implementation.dart';

import '../../features/home/data/repo/home_repo_implementation.dart';
import '../consts/api_service.dart';
import 'local_datasource/hive_db_apply_user.dart';
import 'remote_datasource/apply_user_service/apply_user_service.dart';
import 'remote_datasource/auth_service/login_auth_service.dart';
import 'remote_datasource/auth_service/reset_pass_auth_service.dart';
import 'remote_datasource/auth_service/signout_service.dart';
import 'remote_datasource/login_and_security_service/change_name_pass_service.dart';
import 'remote_datasource/profile_service/add_experience_service.dart';
import 'remote_datasource/profile_service/add_portfolio_service.dart';
import 'remote_datasource/profile_service/edit_profile_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //hive db job
  getIt.registerSingleton<HiveDbJob>(HiveDbJob());
  //hive db Apply user
  getIt.registerSingleton<HiveDbApplyUser>(HiveDbApplyUser());
  // api service
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  //register api service
  getIt.registerSingleton<RegisterApiService>(
    RegisterApiService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //login api service
  getIt.registerSingleton<LoginApiService>(
    LoginApiService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //resetpass api service
  getIt.registerSingleton<ResetPassApiService>(
    ResetPassApiService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //edit profile service
  getIt.registerSingleton<EditProfileService>(
    EditProfileService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //Auth repo implementation
  getIt.registerSingleton<AuthRepoImplementation>(
    AuthRepoImplementation(
      registerApiService: getIt.get<RegisterApiService>(),
      loginApiService: getIt.get<LoginApiService>(),
      resetPassApiService: getIt.get<ResetPassApiService>(),
    ),
  );
  //job api service
  getIt.registerSingleton<JobApiService>(
    JobApiService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //jobs repo implementation
  getIt.registerSingleton<FilterJobsRepoImplementation>(
    FilterJobsRepoImplementation(
      jobApiService: getIt.get<JobApiService>(),
    ),
  );
  //apply user service
  getIt.registerSingleton<ApplyUserService>(
    ApplyUserService(
      apiService: getIt.get<ApiService>(),
    ),
  );
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
      apiService: getIt.get<ApiService>(),
      editProfileService: getIt.get<EditProfileService>(),
    ),
  );
  //add portfolio api service
  getIt.registerSingleton<AddPortfolioService>(
    AddPortfolioService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //portfolio repo impl
  getIt.registerSingleton<PortfolioRepoImplementation>(
    PortfolioRepoImplementation(
      apiService: getIt.get<ApiService>(),
      addPortfolioService: getIt.get<AddPortfolioService>(),
    ),
  );
  //notification repo implementation
  getIt.registerSingleton<NotificationRepoImplementation>(
    NotificationRepoImplementation(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //get Otp service
  getIt.registerSingleton<GetOtpService>(
    GetOtpService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //update name Pass service
  getIt.registerSingleton<UpdateNamePassService>(
    UpdateNamePassService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //login and security repo impl
  getIt.registerSingleton<LoginAndSecurityRepoImplementation>(
    LoginAndSecurityRepoImplementation(
      getOtpService: getIt.get<GetOtpService>(),
      updateNamePassService: getIt.get<UpdateNamePassService>(),
    ),
  );
  //applied repo impl
  getIt.registerSingleton<AppliedJobsRepoImplementation>(
    AppliedJobsRepoImplementation(
      apiService: getIt.get<ApiService>(),
      hiveDbApplyUser: getIt.get<HiveDbApplyUser>(),
    ),
  );
  //addExperienceService
  getIt.registerSingleton<AddExperienceService>(
    AddExperienceService(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //CompleteProfileRepoImpl
  getIt.registerSingleton<CompleteProfileRepoImpl>(
    CompleteProfileRepoImpl(
      addExperienceService: getIt.get<AddExperienceService>(),
    ),
  );
}
