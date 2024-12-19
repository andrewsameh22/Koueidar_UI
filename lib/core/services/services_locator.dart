import 'package:get_it/get_it.dart';

import '../../repositories/home_repository/home_repo.dart';
import '../../repositories/home_repository/home_repo_impl.dart';
import '../../view/app_layout/cubit/app_cubit.dart';
import '../../view/home_screen/cubit/home_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // cubits

    sl.registerFactory(() => AppCubit());
    sl.registerFactory(() => HomeCubit(repo: sl<HomeRepo>()));

    //Repository
    sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl());
  }
}
