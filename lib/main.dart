import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/services/bloc_observer.dart';
import 'package:jobsque/core/services/local_database/hive_db_apply_user.dart';
import 'package:jobsque/core/services/local_database/hive_db_job.dart';

import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init saved job hive
  await HiveDbJob.init();
  //init users apply  hive
  await HiveDbApplyUser.init();

  await CacheHelper.init();
  setupServiceLocator();
  runZoned(
    () => Bloc.observer = BlocObserverService(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppConsts.primary500),
          ),
        );
      },
    );
  }
}
