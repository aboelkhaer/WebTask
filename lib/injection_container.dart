import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:web_app_task/features/home/presentation/cubit/home_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> diInit() async {
  //! Core
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //! Cubit
  sl.registerFactory(() => HomeCubit());
}
