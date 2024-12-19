import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koueidar_ui/view/app_layout/cubit/app_cubit.dart';

import 'core/app_router/routes.dart';
import 'core/bloc_helper/my_bloc_observer.dart';
import 'core/networks/local/cache_helper.dart';
import 'core/networks/remote/dio_helper.dart';
import 'core/services/services_locator.dart';
import 'core/styles/themes.dart';

import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();

  runApp(
    MyApp(), // Wrap your app
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AppCubit>()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return ScreenUtilInit(
            builder: (context, child) {
              return MaterialApp.router(
                routerConfig: AppRouter.router,
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                localizationsDelegates: const [
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                debugShowCheckedModeBanner: false,
                locale: Locale('ar'),
                // Set locale to Arabic for RTL

                color: Colors.white,
                theme: lightTheme,
              );
            },
          );
        },
      ),
    );
  }
}
