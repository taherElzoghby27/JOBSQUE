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
import 'package:jobsque/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:jobsque/features/auth/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:jobsque/features/auth/presentation/view_model/work_location_cubit/work_location_cubit.dart';
import 'package:jobsque/features/complete_profile/presentation/view/complete_profile_process_view.dart';
import 'package:jobsque/features/complete_profile/presentation/view/complete_profile_view.dart';
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
import 'package:jobsque/features/notification/presentation/view/notification_view.dart';
import 'package:jobsque/features/privacy_policy/presentation/view/privacy_view.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view/edit_profile_view.dart';
import 'package:jobsque/features/profile/presentation/view/language/presentation/view/languages_view.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/login_and_security_auth_view.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/login_security_view.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/presentation/view/two_step_verifi_view.dart';
import 'package:jobsque/features/profile/presentation/view/notification/presentation/view/notification_profile_view.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/portfolio_view.dart';
import 'package:jobsque/features/search_jop/presentation/view/search_view.dart';
import 'package:jobsque/features/search_jop/presentation/view_model/search_bloc/search_bloc.dart';
import 'package:jobsque/features/splash/presentation/view/splash_view.dart';
import 'package:jobsque/features/terms_and_conditions/presentation/view/terms_and_condition_view.dart';
import '../../features/auth/presentation/view/auth_view.dart';
import '../../features/auth/presentation/view/create_new_pass_view.dart';
import '../../features/auth/presentation/view/interested_in_work_view.dart';
import '../../features/auth/presentation/view/successfully_view.dart';
import '../../features/auth/presentation/view/work_location_view.dart';
import '../../features/auth/presentation/view_model/interested_in_work_cubit/interested_in_work_cubit.dart';
import '../../features/home/data/repo/home_repo_implementation.dart';
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
final router = GoRouter(
  routes: [
    GoRoute(
      path: splashPath,
      builder: (context, state) => SplashView(),
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
      builder: (context, state) {
        return MultiBlocProvider(
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
          child: NavView(),
        );
      },
    ),
    GoRoute(
      path: interestedInWorkPath,
      builder: (context, state) => BlocProvider(
        create: (_) => InterestedInWorkCubit(),
        child: InteresetedInWorkView(),
      ),
    ),
    GoRoute(
      path: locationWorkPath,
      builder: (context, state) => BlocProvider(
        create: (_) => WorkLocationCubit(),
        child: WorkLocationView(),
      ),
    ),
    GoRoute(
      path: successfullyPagePath,
      builder: (context, state) {
        Map<String, String> data = state.extra as Map<String, String>;
        print("data : $data");
        return SuccessfullView(
          icon: data[StringsEn.icon]!,
          title: data[StringsEn.title]!,
          subTitle: data[StringsEn.subTitle]!,
          labelButton: data[StringsEn.labelButton]!,
          path: data[StringsEn.path]!,
        );
      },
    ),
    GoRoute(
      path: createPassPath,
      builder: (context, state) => CreatePassView(),
    ),
    GoRoute(
      path: searchPath,
      builder: (context, state) => MultiBlocProvider(
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
    GoRoute(
      path: jopDetailPath,
      builder: (context, state) {
        Job job = state.extra as Job;
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => JobDetailsCubit()),
            BlocProvider(
              create: (_) => SavedCubit(
                hiveDbJob: getIt.get<HiveDbJob>(),
              ),
            ),
          ],
          child: JopDetailView(job: job),
        );
      },
    ),
    GoRoute(
      path: applyJopPath,
      builder: (context, state) {
        Map<String, String> data = state.extra as Map<String, String>;
        print(data);
        return MultiBlocProvider(
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
        );
      },
    ),
    GoRoute(
      path: notificationPath,
      builder: (context, state) => NotificationView(),
    ),
    GoRoute(
      path: messagesPath,
      builder: (context, state) => MessagesView(),
    ),
    GoRoute(
      path: chatPath,
      builder: (context, state) => ChatView(),
    ),
    GoRoute(
      path: editProfilePath,
      builder: (context, state) => EditProfileView(),
    ),
    GoRoute(
      path: portfolioPath,
      builder: (context, state) => PortfolioView(),
    ),
    GoRoute(
      path: notificationProfilePath,
      builder: (context, state) => NotificationProfileView(),
    ),
    GoRoute(
      path: loginSecurityPath,
      builder: (context, state) => LoginSecurityView(),
    ),
    GoRoute(
      path: languagePath,
      builder: (context, state) => LanguagesView(),
    ),
    GoRoute(
      path: loginSecurityAuthPath,
      builder: (context, state) {
        String data = state.extra as String;
        return LoginSecurityAuthView(path: data);
      },
    ),
    GoRoute(
      path: twoStepVerifiPath,
      builder: (context, state) {
        return TwoStepVeriView();
      },
    ),
    GoRoute(
      path: helpCenterPath,
      builder: (context, state) {
        return HelpCenterView();
      },
    ),
    GoRoute(
      path: privacyPath,
      builder: (context, state) {
        return PrivacyView();
      },
    ),
    GoRoute(
      path: termConditionPath,
      builder: (context, state) {
        return TermsAndConditionView();
      },
    ),
    GoRoute(
      path: completeProfilePath,
      builder: (context, state) {
        return CompleteProfileView();
      },
    ),
    GoRoute(
      path: completeProfileProcessPath,
      builder: (context, state) {
        String data = state.extra as String;
        return CompleteProfileProcessView(currentPage: data);
      },
    ),
  ],
);
