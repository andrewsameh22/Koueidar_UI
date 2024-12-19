import 'package:go_router/go_router.dart';

import '../../view/app_layout/app_layout.dart';
import '../../view/filter_screen/filter_screen.dart';
import '../../view/home_screen/cubit/home_cubit.dart';

abstract class AppRouter {
  //Start
  static const appLayoutScreen = '/';
  static const filterScreen = '/filterScreen';

  static final router = GoRouter(
    routes: [


      // AppLayoutScreen
      GoRoute(
        path: appLayoutScreen,
        builder: (context, state) => const AppLayoutScreen(),
      ),

      // FilterScreen
      GoRoute(
        path: filterScreen,
        builder: (context, state) =>
            FilterScreen(
              cubit: state.extra as HomeCubit,
            ),
      ),
    ],
  );
}
