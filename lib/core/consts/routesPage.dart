// GoRouter configuration
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/custom_animation.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/services/local_database/hive_db_apply_user.dart';
import 'package:jobsque/core/services/local_database/hive_db_job.dart';
import 'package:jobsque/core/services/service_locator.dart';
import 'package:jobsque/features/applied/data/repo/applied_job_repo_implementation.dart';
import 'package:jobsque/features/applied/presentation/view_models/applied_job_cubit/applied_job_cubit.dart';
import 'package:jobsque/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:jobsque/features/auth/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:jobsque/features/auth/presentation/view_model/work_location_cubit/work_location_cubit.dart';
import 'package:jobsque/features/complete_profile/data/repo/complete_profile_repo_impl.dart';
import 'package:jobsque/features/complete_profile/presentation/view/complete_profile_view.dart';
import 'package:jobsque/features/complete_profile/presentation/view_models/add_experience_cubit/add_experience_cubit.dart';
import 'package:jobsque/features/help_center/presentation/view/help_center_view.dart';
import 'package:jobsque/features/home/presentation/view_models/home_bloc/home_bloc.dart';
import 'package:jobsque/features/home/presentation/view_models/saved_cubit/saved_cubit.dart';
import 'package:jobsque/features/job_detail/data/repo/apply_job_repo_implementation.dart';
import 'package:jobsque/features/job_detail/presentation/view/apply_jop_view.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/bio_data_cubit/bio_data_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/changed_page_cubit/changed_page_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/job_details_cubit/job_details_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/type_of_work_cubit/type_of_work_cubit.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/upload_portfolio_cubit/upload_portfolio_cubit.dart';
import 'package:jobsque/features/messages/presentation/view/chat_view.dart';
import 'package:jobsque/features/messages/presentation/view/messages_view.dart';
import 'package:jobsque/features/nav_bar/presentation/view/nav_view.dart';
import 'package:jobsque/features/notification/data/repos/notification_repo_implementation.dart';
import 'package:jobsque/features/notification/presentation/view/notification_view.dart';
import 'package:jobsque/features/notification/presentation/view_model/notification_cubit.dart';
import 'package:jobsque/features/privacy_policy/presentation/view/privacy_view.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo_implementation.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/edit_profile_view.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view_models/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:jobsque/features/profile/presentation/view/language/presentation/view/languages_view.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/data/repo/login_security_repo_implementation.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/login_and_security_auth_view.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/login_security_view.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view_models/update_name_password_cubit/update_name_pass_cubit.dart';
import 'package:jobsque/features/profile/presentation/view/notification/presentation/view/notification_profile_view.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/repo/portfolio_repo_implementation.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/portfolio_view.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view_models/portfolio_cubit/portfolio_cubit.dart';
import 'package:jobsque/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:jobsque/features/search_jop/presentation/view/search_view.dart';
import 'package:jobsque/features/search_jop/presentation/view_model/search_bloc/search_bloc.dart';
import 'package:jobsque/features/splash/presentation/view/splash_view.dart';
import 'package:jobsque/features/terms_and_conditions/presentation/view/terms_and_condition_view.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view/two_step_verifi_view.dart';
import 'package:jobsque/features/two_step_verifi/presentation/view_models/two_step_verifi/two_step_verification_cubit.dart';
import '../../features/auth/presentation/view/auth_view.dart';
import '../../features/auth/presentation/view/create_new_pass_view.dart';
import '../../features/auth/presentation/view/interested_in_work_view.dart';
import '../../features/auth/presentation/view/successfully_view.dart';
import '../../features/auth/presentation/view/work_location_view.dart';
import '../../features/auth/presentation/view_model/interested_in_work_cubit/interested_in_work_cubit.dart';
import '../../features/complete_profile/presentation/view/complete_profile_process_view.dart';
import '../../features/home/data/repo/home_repo_implementation.dart';
import '../../features/home/presentation/view/suggested_or_recent_jop_view.dart';
import '../../features/job_detail/presentation/view/jop_detail_view.dart';
import '../../features/job_detail/presentation/view_models/apply_job_cubit/apply_job_cubit.dart';
import '../../features/onBoarding/presentation/view/on_boarding_view.dart';

const splashPath = '/';
const onBoardingPath = '/onBoard';
const authPath = '/authPath';
const homePath = '/home';
const interestedInWorkPath = '/interstedInWork';
const successfullyPagePath = '/successfullyView';
const locationWorkPath = '/locationWork';
const accountSetUpPath = '/accountSetUp';
const createPassPath = '/createPassPath';
const searchPath = '/searchPath';
const jopDetailPath = '/jopDetailPath';
const applyJopPath = '/applyJopPath';
const notificationPath = '/notificationPath';
const messagesPath = '/messagesPath';
const chatPath = '/chatPath';
const editProfilePath = '/editProfilePath';
const portfolioPath = '/portfolioPath';
const languagePath = '/langPath';
const loginSecurityPath = '/loginSecurityPath';
const notificationProfilePath = '/notifiProfilePath';
const loginSecurityAuthPath = '/loginSecurityAuthPath';
const twoStepVerifiPath = '/twoStepVerifiPath';
const helpCenterPath = '/helpCenterPath';
const privacyPath = '/privacyPath';
const termConditionPath = '/termConditionPath';
const completeProfilePath = '/completeProfilePath';
const completeProfileProcessPath = '/completeProfileProcessPath';
const suggestedOrRecentJopPath = '/suggestedJopPath';
final router = GoRouter(
  routes: [
    GoRoute(
      path: splashPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: SplashView(),
      ),
    ),
    GoRoute(
      path: onBoardingPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: OnBoardingView(),
      ),
    ),
    GoRoute(
      path: authPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => AuthBloc(
            authRepo: getIt.get<AuthRepoImplementation>(),
          ),
          child: AuthView(),
        ),
      ),
    ),
    GoRoute(
      path: homePath,
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => HomeBloc(
                  jobFilterRepo: getIt.get<FilterJobsRepoImplementation>(),
                )..add(GetJobsEvent()),
              ),
              BlocProvider(
                create: (_) => SavedCubit(
                  hiveDbJob: getIt.get<HiveDbJob>(),
                ),
              ),
              BlocProvider(
                create: (_) => ProfileCubit(
                  profileRepo: getIt.get<ProfileRepoImplementation>(),
                ),
              ),
              BlocProvider(
                create: (_) => AppliedJobCubit(
                  appliedJobRepo: getIt.get<AppliedJobsRepoImplementation>(),
                  jobFilterRepo: getIt.get<FilterJobsRepoImplementation>(),
                )..getActiveJobs(),
              ),
            ],
            child: NavView(),
          ),
        );
      },
    ),
    GoRoute(
      path: suggestedOrRecentJopPath,
      pageBuilder: (context, state) {
        String type = state.extra as String;
        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => HomeBloc(
                  jobFilterRepo: getIt.get<FilterJobsRepoImplementation>(),
                )..add(GetJobsEvent()),
              ),
              BlocProvider(
                create: (_) => SavedCubit(
                  hiveDbJob: getIt.get<HiveDbJob>(),
                ),
              ),
            ],
            child: SuggestedOrRecentJopView(type: type),
          ),
        );
      },
    ),
    GoRoute(
      path: interestedInWorkPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => InterestedInWorkCubit(),
          child: InteresetedInWorkView(),
        ),
      ),
    ),
    GoRoute(
      path: locationWorkPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => WorkLocationCubit(
            authRepo: getIt.get<AuthRepoImplementation>(),
          ),
          child: WorkLocationView(),
        ),
      ),
    ),
    GoRoute(
      path: successfullyPagePath,
      pageBuilder: (context, state) {
        Map<String, String> data = state.extra as Map<String, String>;
        print("data : $data");
        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: SuccessfullView(
            icon: data[StringsEn.icon]!,
            title: data[StringsEn.title]!,
            subTitle: data[StringsEn.subTitle]!,
            labelButton: data[StringsEn.labelButton]!,
            path: data[StringsEn.path]!,
          ),
        );
      },
    ),
    GoRoute(
      path: createPassPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: CreatePassView(),
      ),
    ),
    GoRoute(
      path: searchPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => SearchBloc(
                jobFilterRepo: getIt.get<FilterJobsRepoImplementation>(),
              ),
            ),
            BlocProvider(
              create: (_) => SavedCubit(
                hiveDbJob: getIt.get<HiveDbJob>(),
              ),
            ),
          ],
          child: SearchView(),
        ),
      ),
    ),
    GoRoute(
      path: jopDetailPath,
      pageBuilder: (context, state) {
        Job job = state.extra as Job;
        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => JobDetailsCubit()),
              BlocProvider(
                create: (_) => SavedCubit(
                  hiveDbJob: getIt.get<HiveDbJob>(),
                ),
              ),
            ],
            child: JopDetailView(job: job),
          ),
        );
      },
    ),
    GoRoute(
      path: applyJopPath,
      pageBuilder: (context, state) {
        Map<String, dynamic> data = state.extra as Map<String, dynamic>;
        print(data);
        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => ApplyJobCubit(
                  hiveDbApplyUser: getIt.get<HiveDbApplyUser>(),
                  applyUserRepo: getIt.get<ApplyUserRepoImplementation>(),
                ),
              ),
              BlocProvider(
                create: (BuildContext context) => BioDataCubit(),
              ),
              BlocProvider(
                create: (BuildContext context) => ChangedPageCubit(),
              ),
              BlocProvider(
                create: (BuildContext context) => TypeOfWorkCubit(),
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    UploadPortfolioCubit()..getFiles(),
              ),
            ],
            child: ApplyJopView(data: data),
          ),
        );
      },
    ),
    GoRoute(
      path: notificationPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => NotificationCubit(
            notificationRepo: getIt.get<NotificationRepoImplementation>(),
          ),
          child: NotificationView(),
        ),
      ),
    ),
    GoRoute(
      path: messagesPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: MessagesView(),
      ),
    ),
    GoRoute(
      path: chatPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: ChatView(),
      ),
    ),
    GoRoute(
      path: editProfilePath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => EditProfileCubit(
            authRepo: getIt.get<AuthRepoImplementation>(),
          ),
          child: EditProfileView(),
        ),
      ),
    ),
    GoRoute(
      path: portfolioPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => PortfolioCubit(
                portfolioRepo: getIt.get<PortfolioRepoImplementation>(),
              ),
            ),
          ],
          child: PortfolioView(),
        ),
      ),
    ),
    GoRoute(
      path: notificationProfilePath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: NotificationProfileView(),
      ),
    ),
    GoRoute(
      path: loginSecurityPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: LoginSecurityView(),
      ),
    ),
    GoRoute(
      path: languagePath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: LanguagesView(),
      ),
    ),
    GoRoute(
      path: loginSecurityAuthPath,
      pageBuilder: (context, state) {
        String data = state.extra as String;
        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (_) => UpdateNamePassCubit(
              loginAndSecurityRepo:
                  getIt.get<LoginAndSecurityRepoImplementation>(),
            ),
            child: LoginSecurityAuthView(path: data),
          ),
        );
      },
    ),
    GoRoute(
      path: twoStepVerifiPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => TwoStepVerificationCubit(),
          child: TwoStepVeriView(),
        ),
      ),
    ),
    GoRoute(
      path: helpCenterPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: HelpCenterView(),
      ),
    ),
    GoRoute(
      path: privacyPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: PrivacyView(),
      ),
    ),
    GoRoute(
      path: termConditionPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: TermsAndConditionView(),
      ),
    ),
    GoRoute(
      path: completeProfilePath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: CompleteProfileView(),
      ),
    ),

    GoRoute(
      path: completeProfileProcessPath,
      pageBuilder: (context, state) {
        String data = state.extra as String;
        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (_) => AddExperienceCubit(
              getIt.get<CompleteProfileRepoImpl>(),
            ),
            child: CompleteProfileProcessView(
              currentPage: data,
            ),
          ),
        );
      },
    ),
  ],
);
