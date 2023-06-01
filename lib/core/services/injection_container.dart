import 'package:bebop/core/network/local/cache_helper.dart';
import 'package:bebop/core/network/remote/network_info.dart';
import 'package:bebop/features/domain/usecases/user/add_memory_usecase.dart';
import 'package:bebop/features/domain/usecases/user/get_memories_usecase.dart';
import 'package:bebop/features/domain/usecases/user/update_baby_info_usecase.dart';
import 'package:bebop/features/presentation/view/home/cubit/cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/data/datasources/auth/local/auth_local_data_sources.dart';
import '../../features/data/datasources/auth/local/auth_local_datasources_impl.dart';
import '../../features/data/datasources/auth/remote/auth_remote_datasources.dart';
import '../../features/data/datasources/auth/remote/auth_remote_datasources_impl.dart';
import '../../features/data/datasources/user/user_remote_datasource.dart';
import '../../features/data/datasources/user/user_remote_datasource_impl.dart';
import '../../features/data/repositories/auth_repository_impl.dart';
import '../../features/data/repositories/user_repository_impl.dart';
import '../../features/domain/repositories/firebase_auth_repository.dart';
import '../../features/domain/repositories/user_repository.dart';
import '../../features/domain/usecases/auth/signin_usecase.dart';
import '../../features/domain/usecases/auth/signout_usecase.dart';
import '../../features/domain/usecases/auth/signup_usecase.dart';
import '../../features/domain/usecases/user/delete_memory_usecase.dart';
import '../../features/domain/usecases/user/get_current_uid_usecase.dart';
import '../../features/domain/usecases/user/get_current_user_usecase.dart';
import '../../features/presentation/view/layout/cubit/cubit.dart';
import '../../features/presentation/view/login/cubit/login_cubit.dart';
import '../../features/presentation/view/profile/cubit/cubit.dart';
import '../../features/presentation/view/register/cubit/register_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Shared Prefs
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);

  //Cubit
  sl.registerLazySingleton<LayoutCubit>(() => LayoutCubit());
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl()));
  sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit(sl()));
  sl.registerLazySingleton<ProfileCubit>(
      () => ProfileCubit(sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerLazySingleton<ReminderCubit>(() => ReminderCubit());

  //Core

  //TODO:USE IT
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  ///Auth
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));

  ///User
  sl.registerLazySingleton(() => GetCurrentUIDUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => UpdateBabyInfoUseCase(sl()));
  sl.registerLazySingleton(() => AddMemoryUseCase(sl()));
  sl.registerLazySingleton(() => GetMemoriesUseCase(sl()));
  sl.registerLazySingleton(() => DeleteMemoryUseCase(sl()));

  //Repository
  sl.registerLazySingleton<FirebaseAuthRepository>(
      () => FirebaseAuthRepositoryImpl(
            authDataSource: sl(),
            localDataSource: sl(),
            userRemoteDataSource: sl(),
          ));

  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSource: sl()));

  //Data Source
  ///Remote Data Source
  sl.registerLazySingleton<FirebaseRemoteAuthDataSource>(
      () => FirebaseRemoteAuthDataSourceImpl(auth: sl(), firestore: sl()));

  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
        auth: sl(), firestore: sl(), firebaseStorage: sl()),
  );

  ///Local Data Source
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(preferences: sl()));

  //External
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => firestore);
  sl.registerLazySingleton(() => firebaseStorage);

  sl.registerLazySingleton<CacheHelper>(() => CacheHelper(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
