import 'package:bebop/core/network/local/cache_helper.dart';
import 'package:bebop/core/network/remote/network_info.dart';
import 'package:bebop/features/login/presentation/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Blocs
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit());

  /// Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
